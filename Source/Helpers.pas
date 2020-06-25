namespace RemObjects.Elements.System;

interface

uses
  Foundation;

{$G+}

method __ElementsClassLockEnter(var x: intptr_t): Boolean; public;
method __ElementsClassLockExit(var x: intptr_t); public;

method __ElementsReadLine(): String; public;
method __ElementsNullReferenceRaiseException(s: String); public;

method __ElementsObjcClassInfoToString(clz: &Class): String; public;

implementation

method __ElementsNullReferenceRaiseException(s: String);
begin
  if s = nil then
    NSException.&raise('NullReferenceException') format('Null Reference Exception');
  NSException.&raise('NullReferenceException') format('Null Reference Exception for expression: %@', s);
end;

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

method __ElementsObjcClassInfoToString(clz: &Class):String;
begin
  var cl := class_getName(clz);
  var s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
  var res := new NSMutableString withCapacity(1024);
  res.appendString('{"name":"');
  res.appendString(s);
  res.appendString('"');
  var sz := class_getSuperclass(clz);
  if sz <> nil then begin
    s := new  Foundation.NSString withCString(class_getName(sz)) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    res.appendString(',"base":"');
    res.appendString(s);
    res.appendString('"');
  end;
  res.appendString( ',"methods":[');
  var methodCount: UInt32 := 0;
  var methods: ^&Method := class_copyMethodList(clz, @methodCount);
  for i: Integer := 0 to methodCount - 1 do begin
    var &method: &Method := methods[i];
    cl := sel_getName(method_getName(&method));
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    if i <> 0 then
      res.appendString(',');
    res.appendString('{"selector":"');
    res.appendString(s);
    res.appendString('"');
    cl := method_getTypeEncoding(&method);
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    s := s.stringByReplacingOccurrencesOfString('"') withString('\"');
    res.appendString(',"signature":"');
    res.appendString(s);
    res.appendString('"');
    var imp := method_getImplementation(&method);
    var impl := Int64(^IntPtr(@imp)^);
    res.appendString( ',"implementation":"'+impl);
    res.appendString('"}');
    //res.appendString( '}';
  end;
  rtl.free(methods);
  res.appendString(']');
  begin
    res.appendString( ',"propeties":[');
    //var methodCount: UInt32 := 0;
    var props: ^objc_property_t := class_copyPropertyList(clz, @methodCount);
    for i: Integer := 0 to methodCount - 1 do begin
      var &prop := props[i];
      cl := property_getName(&prop);
      s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
      if i <> 0 then
        res.appendString(',');
      res.appendString( '{"name":"');
      res.appendString(s);
      res.appendString('"');
      cl := property_getAttributes(&prop);
      s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
      s := s.stringByReplacingOccurrencesOfString('"') withString('\"');
      res.appendString(',"signature":"');
      res.appendString(s);
      res.appendString('"}');
      //res.appendString( '}';
    end;
    rtl.free(props);
    res.appendString(']');
  end;
  begin
    res.appendString(',"fields":[');
    //var methodCount: UInt32 := 0;
    var props: ^Ivar := class_copyIvarList(clz, @methodCount);
    for i: Integer := 0 to methodCount - 1 do begin
      var &prop := props[i];
      cl := ivar_getName(&prop);
      s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
      if i <> 0 then
        res.appendString(',');
      res.appendString( '{"name":"');
      res.appendString(s);
      res.appendString('"');
      cl := ivar_getTypeEncoding(&prop);
      s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
      s := s.stringByReplacingOccurrencesOfString('"') withString('\"');
      res.appendString( ',"type":"');
      res.appendString(s);
      res.appendString('"');
      var off := ivar_getOffset(&prop);
      res.appendString( ',"offset":"'+off);
      res.appendString('"}');
      //res.appendString('}';
    end;
    rtl.free(props);
    res.appendString(']');
  end;
  clz := objc_getMetaClass(class_getName(clz));
  res.appendString( ',"classMethods":[');
  methodCount := 0;
  methods := class_copyMethodList(clz, @methodCount);
  for i: Integer := 0 to methodCount - 1 do begin
    var &method: &Method := methods[i];
    cl := sel_getName(method_getName(&method));
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    if i <> 0 then
      res.appendString(',');
    res.appendString('{"selector":"');
    res.appendString(s);
    res.appendString('"');
    cl := method_getTypeEncoding(&method);
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    s := s.stringByReplacingOccurrencesOfString('"') withString('\"');
    res.appendString( ',"signature":"');
    res.appendString(s);
    res.appendString('"');
    var imp := method_getImplementation(&method);
    var impl := Int64(^IntPtr(@imp)^);
    res.appendString( ',"implementation":"'+impl);
    res.appendString('"}');
    //res.appendString( '}';
  end;
  rtl.free(methods);
  res.appendString(']');
  res.appendString(',"classProperties":[');
  //var methodCount: UInt32 := 0;
  var props: ^objc_property_t := class_copyPropertyList(clz, @methodCount);
  for i: Integer := 0 to methodCount - 1 do begin
    var &prop := props[i];
    cl := property_getName(&prop);
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    if i <> 0 then
      res.appendString(',');
    res.appendString( '{"name":"');
    res.appendString(s);
    res.appendString('"');
    cl := property_getAttributes(&prop);
    s := new  Foundation.NSString withCString(cl) encoding(Foundation.NSStringEncoding.UTF8StringEncoding);
    s := s.stringByReplacingOccurrencesOfString('"') withString('\"');
    res.appendString(',"signature":"');
    res.appendString(s);
    res.appendString('"}');
    //res.appendString( '}';
  end;
  rtl.free(props);
  res.appendString(']}');
  // var buf := new AnsiChar[res.length+1];
  // res.getCString(buf);
  exit res;
  // var buf := new AnsiChar[res.length+1];
  // res.getCString(buf);
  //exit buf;
end;

end.