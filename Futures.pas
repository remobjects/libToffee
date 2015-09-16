namespace RemObjects.Elements.Futures;

interface

uses
  Foundation;

type
  IOxygeneFuture = public interface
    property done: Boolean read;
    property started: Boolean read;
    property value: id read;
    property exception: NSException read;
    method wait(aRaise: Boolean := true);
  end;
  
  IOxygeneFuture1<T> = public interface mapped to IOxygeneFuture
  public
    property done: Boolean read mapped.done;
    property started: Boolean read mapped.started;
    property value: T read T(mapped.value);
    property exception: NSException read mapped.exception;
    method wait; mapped to wait;
  end;
  
  __Oxygene_Block = public block: id;
  
  __Oxygene_Future = public class(IOxygeneFuture)
  private
    fException: Exception; volatile;
    fValue: id; volatile;
    fBlock: __Oxygene_Block;
    fStarted: Integer; volatile;
    fDone: Integer; volatile;
    fLock: NSCondition; volatile;
    method IntRun;
    method value: id;
  public
    constructor(aBlock: __Oxygene_Block);
    method startAsync;
    property done: Boolean read fDone <> 0;
    property exception: NSException read fException;
    property started: Boolean read fStarted <> 0;
    property value: id read value;
    method wait(aRaise: Boolean := true);
  end;
  
  
  __Oxygene_Future_Helper = public static class mapped to Object // all inline
  public
    class method IsDone(aFuture: IOxygeneFuture): Boolean; inline;
    class method Execute(aFuture: block): IOxygeneFuture; inline;
    class method ExecuteAsync(aFuture: block; aWantResult: Boolean): IOxygeneFuture; inline;
    class method IsDone<T>(aFuture: IOxygeneFuture1<T>): Boolean; inline;
    class method Execute<T>(aFuture: block: T): IOxygeneFuture1<T>; inline;
    class method ExecuteAsync<T>(aFuture: block: T; aWantResult: Boolean): IOxygeneFuture1<T>; inline;
  end;

implementation

constructor __Oxygene_Future(aBlock: __Oxygene_Block);
begin
  fBlock := aBlock;
end;

method __Oxygene_Future.startAsync;
begin
  if interlockedExchange(var fStarted, 1) = 0 then 
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), method begin
                                     IntRun();
  end);
end;

method __Oxygene_Future.wait(aRaise: Boolean := true);
begin
  if interlockedExchange(var fStarted, 1) = 0 then 
    IntRun()
  else begin
    if fLock = nil then begin
      locking self do begin
        if fDone <> 0 then exit;
        if fLock = nil then 
          fLock := new NSCondition;
      end;
    end;
    fLock.lock();
    while fDone = 0 do 
      fLock.wait();
    fLock.unlock();
  end;
  if aRaise and (fException <> nil) then
    raise fException;
end;

method __Oxygene_Future.IntRun;
begin
  try
    fValue := fBlock();
  except
    on e: NSException do
    fException := e;
  end;
  locking self do begin
    fDone := 1;
    if fLock <> nil then begin
      fLock.lock;
      fLock.broadcast;
      fLock.unlock;
    end;
  end;
end;

method __Oxygene_Future.value: id;
begin
  if fDone = 0 then 
    wait;
  exit fValue;
end;

class method __Oxygene_Future_Helper.IsDone(aFuture: IOxygeneFuture): Boolean; 
begin
  exit aFuture.done;
end;

class method __Oxygene_Future_Helper.Execute(aFuture: block): IOxygeneFuture; 
begin
  exit new __Oxygene_Future(-> begin aFuture(); exit nil end);
end;

class method __Oxygene_Future_Helper.ExecuteAsync(aFuture: block; aWantResult: Boolean): IOxygeneFuture; 
begin
  var lFuture := new __Oxygene_Future(-> begin aFuture(); exit nil end);
  lFuture.startAsync;
  exit lFuture;
end;

class method __Oxygene_Future_Helper.IsDone<T>(aFuture: IOxygeneFuture1<T>): Boolean; 
begin
  exit IOxygeneFuture(aFuture).done;
end;

class method __Oxygene_Future_Helper.Execute<T>(aFuture: block: T): IOxygeneFuture1<T>; 
begin
  exit new __Oxygene_Future(__Oxygene_Block(aFuture));
end;

class method __Oxygene_Future_Helper.ExecuteAsync<T>(aFuture: block: T; aWantResult: Boolean): IOxygeneFuture1<T>; 
begin
  var lFuture := new __Oxygene_Future(__Oxygene_Block(aFuture));
  lFuture.startAsync;
  exit lFuture;
end;

end.
