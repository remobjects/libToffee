namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  TaskState = enum(Created, Queued, Started, Done) of Integer;
  TaskBlock = public block();
  TaskBlockGen<T> = public block(): T;

  TaskCompletionSource<T> = public __ElementsTaskCompletionSource<T>;
  Task = public __ElementsTask;
  Task1<T> = public __ElementsTask1<T>;

  __ElementsTask = public class
  assembly
    fState: TaskState;
    fException: NSException;
    fAsyncState: Object;
    fDelegate: Object; // callable<T>; runnable
    fDoneHandlers: Object; // nil, NSMutableArrayList or task
    fLock: NSCondition := new NSCondition;
    method DoRun; virtual;
    method Done(ex: NSException);
    method AddOrRunContinueWith(aTask: __ElementsTask);
    constructor(aDelegate: Object; aState: Object);
  public
    constructor(aIn:TaskBlock; aState: Object := nil);

    method ContinueWith(aAction: block(aTask: __ElementsTask); aState: Object := nil): __ElementsTask;
    method ContinueWith<T>(aAction: block(aTask: __ElementsTask): T; aState: Object := nil): __ElementsTask1<T>;

    class method Run(aIn: TaskBlock): __ElementsTask;
    class method Run<T>(aIn: TaskBlockGen<T>): __ElementsTask1<T>;

    property Exception: NSException read fException;
    property AsyncState: Object read fAsyncState;
    property IsFaulted: Boolean read fException <> nil;
    property IsCompleted: Boolean read fState = TaskState.Done;
    method &Await(aCompletion: __ElementsIAwaitCompletion): Boolean; // true = yield; false = long done

    {$HIDE W38}
    method Wait; reintroduce; virtual;
    {$SHOW W38}
    method Wait(aTimeoutMSec: Integer): Boolean; virtual;

    method Start(aScheduler: dispatch_queue_t := nil); virtual;


    class property CompletedTask: Task read new Task(fState := TaskState.Done); lazy;
    class method FromResult<T>(x: T): Task1<T>;
    begin
      exit new Task1<T>(fState := TaskState.Done, fResult := x);
    end;

    class property ThreadSyncHelper: IThreadSyncHelper := new __ElementsDefaultThreadSyncHelper;
  end;

  __ElementsTask1<T> = public class(__ElementsTask)
  assembly
    fResult: T;
    constructor(aDelegate: Object; aState: Object); empty;
    method getResult: T;
    method DoRun; override;
  public
    constructor(aIn: TaskBlockGen<T>; aState: Object := nil);
    method ContinueWith(aAction: block(aTask: __ElementsTask1<T>); aState: Object := nil): __ElementsTask;
    method ContinueWith<TR>(aAction: block(aTask: __ElementsTask1<T>): TR; aState: Object := nil): __ElementsTask1<TR>;
    property &Result: T read getResult;
  end;

  __ElementsTaskCompletionSource<T> = public class
  private
    fTask: __ElementsTask1<T>;
  public
    constructor(aState: Object := nil);
    method SetException(ex: NSException);
    method SetResult(val: T);
    property Task: __ElementsTask1<T> read fTask;
  end;

  TaskCompletionSourceTask<T> = class(__ElementsTask1<T>)
  assembly
    method DoRun; override; empty;
  end;

  __ElementsIAwaitCompletion = public interface
    method moveNext(aState: Object);
  end;

  IThreadSyncHelper = public interface
    method GetThreadContext: dispatch_queue_t;
    method SyncBack(aContext: dispatch_queue_t; aAction: dispatch_block_t);
  end;

  __ElementsDefaultThreadSyncHelper = public class(IThreadSyncHelper)
  public
    method SyncBack(aContext: dispatch_queue_t; aAction: dispatch_block_t);
    method GetThreadContext: dispatch_queue_t;
  end;

implementation

{ __ElementsTask }

constructor __ElementsTask(aDelegate: Object; aState: Object);
begin
  fDelegate := aDelegate;
  fAsyncState := aState;
end;

constructor __ElementsTask(aIn: TaskBlock; aState: Object);
begin
  if aIn = nil then raise new NSException withName(NSInvalidArgumentException) reason('aIn is nil') userInfo(nil);
  constructor(Object(aIn), aState);
end;

method __ElementsTask.DoRun;
begin
  fLock.lock;
  try
    fState := TaskState.Started;
  finally
    fLock.unlock;
  end;
  try
    TaskBlock(fDelegate)();
    Done(nil);
  except
    on ex: NSException do
     Done(ex);
  end;
end;

method __ElementsTask.Done(ex: NSException);
begin
  fException := ex;
  var lCW: Object;
  fLock.lock;
  try
    fState := TaskState.Done;
    lCW := fDoneHandlers;
    fDoneHandlers := nil;
    fLock.broadcast;
  finally
    fLock.unlock;
  end;
  if lCW <> nil then begin
    var lTask := __ElementsTask(lCW);
    if lTask <> nil then begin
      lTask.DoRun;
    end
    else begin
      var lList := NSMutableArray<__ElementsTask>(lCW);
      for i: Integer := 0 to lList.count -1 do
        lList[i].DoRun;
    end;
  end;
end;

method __ElementsTask.ContinueWith(aAction: block(aTask: __ElementsTask); aState: Object): __ElementsTask;
begin
  result := new __ElementsTask(-> aAction(self), aState);
  result.fState := TaskState.Queued;

  AddOrRunContinueWith(result);
end;

method __ElementsTask.ContinueWith<T>(aAction:block(aTask: __ElementsTask): T; aState: Object): __ElementsTask1<T>;
begin
  var r: TaskBlockGen<T> := -> aAction(self);
  result := new __ElementsTask1(r, aState);
  result.fState := TaskState.Queued;

  AddOrRunContinueWith(result);
end;

method __ElementsTask.AddOrRunContinueWith(aTask: __ElementsTask);
begin
  var lDone := false;
  if fState = TaskState.Done then begin
    lDone := true
  end
  else locking self do begin
    if fState = TaskState.Done then begin
      lDone := true
    end
    else if fDoneHandlers = nil then begin
      fDoneHandlers := aTask
    end
    else begin
      var lNew := new NSMutableArray<__ElementsTask>();
      lNew.addObject(duck<__ElementsTask>(fDoneHandlers));
      lNew.addObject(aTask);
      fDoneHandlers := lNew;
    end;
  end;
  if lDone then begin
    aTask.DoRun;
  end;
end;

method __ElementsTask.Wait;
begin
  if fState = TaskState.Done then exit;
  fLock.lock;
  try
    if fState = TaskState.Done then exit;
    while fState <> TaskState.Done do begin
      fLock.wait()
    end;
  finally
    fLock.unlock;
  end;
end;

method __ElementsTask.Wait(aTimeoutMSec: Integer): Boolean;
begin
  if fState = TaskState.Done then
    exit true;

  fLock.lock;
  try
    if fState = TaskState.Done then
      exit true;

    var lTO := NSDate.date.dateByAddingTimeInterval(aTimeoutMSec * 0.001);
    while fState <> TaskState.Done do begin
      if not fLock.waitUntilDate(lTO) then
        exit false;
    end;

    result := true;
  finally
    fLock.unlock;
  end;
end;

method __ElementsTask.Start(aScheduler: dispatch_queue_t);
begin
  fLock.lock;
  try
    if fState <> TaskState.Created then
      raise new NSException withName(NSInvalidArgumentException) reason('Task already started/queued/done') userInfo(nil);
    fState := TaskState.Queued;
  finally
    fLock.unlock;
  end;

  dispatch_async(coalesce(aScheduler, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)), -> DoRun());
end;

class method __ElementsTask.Run(aIn: TaskBlock): __ElementsTask;
begin
  result := new __ElementsTask(aIn);
  result.Start;
end;

class method __ElementsTask.Run<T>(aIn: TaskBlockGen<T>): __ElementsTask1<T>;
begin
  result := new __ElementsTask1<T>(aIn);
  result.Start;
end;

method __ElementsTask.Await(aCompletion: __ElementsIAwaitCompletion): Boolean;
begin
  if IsCompleted then
    exit false;

  var q := __ElementsTask.ThreadSyncHelper.GetThreadContext;
  if q <> nil then begin
    ContinueWith(a -> begin
      __ElementsTask.ThreadSyncHelper.SyncBack(q, -> begin
        aCompletion.moveNext(a);
      end);
    end);
  end else
    ContinueWith(a -> begin
      aCompletion.moveNext(a);
    end, nil);

  result := true;
end;

{ __ElementsTask1<T> }

method __ElementsTask1<T>.getResult: T;
begin
  Wait();
  if fException <> nil then
    raise fException;
  result := fResult;
end;

method __ElementsTask1<T>.DoRun;
begin
  fLock.lock;
  try
    fState := TaskState.Started;
  finally
    fLock.unlock;
  end;
  try
    fResult := TaskBlockGen<T>(fDelegate)();
    Done(nil);
  except
    on ex: NSException do
     Done(ex);
  end;
end;

constructor __ElementsTask1<T>(aIn: TaskBlockGen<T>; aState: Object);
begin
  if aIn = nil then raise new NSException withName(NSInvalidArgumentException) reason('aIn is nil') userInfo(nil);
  inherited constructor(aIn, aState);
end;

method __ElementsTask1<T>.ContinueWith(aAction: block(aTask: __ElementsTask1<T>); aState: Object := nil): __ElementsTask;
begin
  result := new __ElementsTask(-> aAction(self), aState);
  result.fState := TaskState.Queued;

  AddOrRunContinueWith(result);
end;

method __ElementsTask1<T>.ContinueWith<TR>(aAction: block(aTask: __ElementsTask1<T>): TR; aState: Object := nil): __ElementsTask1<TR>;
begin
  var r: TaskBlockGen<TR> := -> aAction(self);
  result := new __ElementsTask1(r, aState);
  result.fState := TaskState.Queued;

  AddOrRunContinueWith(result);
end;

{ __ElementsTaskCompletionSource<T> }

constructor __ElementsTaskCompletionSource<T>(aState: Object);
begin
  fTask := new TaskCompletionSourceTask<T>(Object(nil), aState);
  fTask.fState := TaskState.Started;
end;

method __ElementsTaskCompletionSource<T>.SetException(ex: NSException);
begin
  fTask.fLock.lock;
  try
    if fTask.fState = TaskState.Done then raise new NSException withName(NSInvalidArgumentException) reason('Task already done') userInfo(nil);
    fTask.fException := ex;
    fTask.fState := TaskState.Done;
  finally
    fTask.fLock.unlock;
  end;
  fTask.Done(ex);
end;

method __ElementsTaskCompletionSource<T>.SetResult(val: T);
begin
  fTask.fLock.lock;
  try
    if fTask.fState = TaskState.Done then raise new NSException withName(NSInvalidArgumentException) reason('Task already done') userInfo(nil);
    fTask.fResult := val;
    fTask.fState := TaskState.Done;
  finally
    fTask.fLock.unlock;
  end;
  fTask.Done(nil);
end;

{ __ElementsDefaultThreadSyncHelper }

method __ElementsDefaultThreadSyncHelper.GetThreadContext: dispatch_queue_t;
begin
  if NSThread.isMainThread then
    result := dispatch_get_main_queue;
end;

method __ElementsDefaultThreadSyncHelper.SyncBack(aContext: dispatch_queue_t; aAction: dispatch_block_t);
begin
  dispatch_async(aContext, aAction);
end;

end.