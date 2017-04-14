namespace RemObjects.Elements.System;

interface

uses
  Foundation;

{$G+}

method __ElementsClassLockEnter(var x: intptr_t): Boolean; public;
method __ElementsClassLockExit(var x: intptr_t); public;

method __ElementsReadLine(): String; public;

implementation

method __ElementsClassLockEnter(var x: intptr_t): Boolean;
begin
  if x = -1 then exit false;
  var cid: uint64_t;
  pthread_threadid_np(nil, var cid);

  var lValue := interlockedCompareExchange(var x, cid, 0); // returns old

  if lValue = 0 then exit true; // value was zero, we should run.
  if lValue = cid then exit false; // same thread, but already running, don't go again.
  if lValue = -1 then exit false; // it's done in the mean time, we should exit.

  // At this point it's NOT the same thread, and not done loading yet.
  repeat
    sched_yield;
    usleep(10);
  until interlockedCompareExchange(var x, -1, -1) = -1;
  exit false;
end;

method __ElementsClassLockExit(var x:intptr_t);
begin
  interlockedExchange(var x, -1)
end;

method __ElementsReadLine: String;
begin
  result := '';
  loop begin
    var c := getchar();
    if c in [10, 13] then
      exit;
    result := result+Char(c);
  end;
end;

end.