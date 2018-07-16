namespace RemObjects.Elements.System;

uses
  Foundation;

type
  ParallelLoopState = public class
  private
  public
    property IsStopped: Boolean read private write;
    method &Break;
    begin
      if not IsStopped then IsStopped := True;
    end;
  end;

  &Parallel = static public class
  public
    class method &For(fromInclusive: Integer; toExclusive: Integer; body: block(aSource: Integer; aState: ParallelLoopState));
    begin
      var lthreadcnt := rtl.sysconf(rtl._SC_NPROCESSORS_ONLN);
      var lcurrTasks: Integer := 0;
      var levent := new NSCondition();
      var ls:= new ParallelLoopState();
      for m: Integer := fromInclusive to toExclusive - 1 do begin
        while interlockedInc(var lcurrTasks, 0) >= lthreadcnt do begin
          if ls.IsStopped then Break;
          levent.lock;
          try
            levent.wait;
          finally
            levent.unlock;
          end;
        end;
        if ls.IsStopped then Break;
        interlockedInc(var lcurrTasks);
        new Task(->
          begin
            body.Invoke(m, ls);
            interlockedDec(var lcurrTasks);
            levent.lock;
            try
              levent.broadcast;
            finally
              levent.unlock;
            end;
          end).Start;
      end;
      while interlockedInc(var lcurrTasks, 0) > 0 do begin
        levent.lock;
        try
          levent.wait;
        finally
          levent.unlock;
        end;
      end;
    end;


    class method &For(fromInclusive: Int64; toExclusive: Int64; body: block(aSource: Int64; aState: ParallelLoopState));
    begin
      var lthreadcnt := rtl.sysconf(rtl._SC_NPROCESSORS_ONLN);
      var lcurrTasks: Integer := 0;
      var levent := new NSCondition();
      var ls:= new ParallelLoopState();
      for m: Int64 := fromInclusive to toExclusive - 1 do begin
        while interlockedInc(var lcurrTasks, 0) >= lthreadcnt do begin
          if ls.IsStopped then Break;
          levent.lock;
          try
            levent.wait;
          finally
            levent.unlock;
          end;
        end;
        if ls.IsStopped then Break;
        interlockedInc(var lcurrTasks);
        new Task(->
          begin
            body.Invoke(m, ls);
            interlockedDec(var lcurrTasks);
            levent.lock;
            try
              levent.broadcast;
            finally
              levent.unlock;
            end;
          end).Start;
      end;
      while interlockedInc(var lcurrTasks, 0) > 0 do begin
        levent.lock;
        try
          levent.wait;
        finally
          levent.unlock;
        end;
      end;
    end;

    class method ForEach<TSource>(source: INSFastEnumeration<TSource>; body: block(aSource: TSource; aState: ParallelLoopState));
    begin
      var lthreadcnt := rtl.sysconf(rtl._SC_NPROCESSORS_ONLN);
      var lcurrTasks: Integer := 0;
      var levent := new NSCondition();
      var ls:= new ParallelLoopState();
      for m in source do begin
        while interlockedInc(var lcurrTasks, 0) >= lthreadcnt do begin
          if ls.IsStopped then Break;
          levent.lock;
          try
            levent.wait;
          finally
            levent.unlock;
          end;
        end;
        if ls.IsStopped then Break;
        interlockedDec(var lcurrTasks);
        new Task(->
          begin
            body.Invoke(m, ls);
            interlockedDec(var lcurrTasks);
            levent.lock;
            try
              levent.broadcast;
            finally
              levent.unlock;
            end;
          end).Start;
      end;
      while interlockedInc(var lcurrTasks, 0) > 0 do begin
        levent.lock;
        try
          levent.wait;
        finally
          levent.unlock;
        end;
      end;
    end;
  end;

end.