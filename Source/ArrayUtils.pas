namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  ArrayUtils = public static class
  private
    class method intStringToSequence(val: String): INSFastEnumeration; iterator;
  public
    class method idArrayToSequence(val: array of id): INSFastEnumeration; iterator;
    class method stringToSequence(val: String): RemObjects.Elements.System.INSFastEnumeration<nullable Char>;
    class method genericArrayToSequence<T>(val: array of T): RemObjects.Elements.System.INSFastEnumeration<T>; inline; where T is class;
    class method charArrayToSequence(val: array of AnsiChar): RemObjects.Elements.System.INSFastEnumeration<nullable AnsiChar>;
    class method wcharArrayToSequence(val: array of Char): RemObjects.Elements.System.INSFastEnumeration<nullable Char>;
    class method boolArrayToSequence(val: array of Boolean): RemObjects.Elements.System.INSFastEnumeration<nullable Boolean>;
    class method byteArrayToSequence(val: array of Byte): RemObjects.Elements.System.INSFastEnumeration<nullable Byte>;
    class method sbyteArrayToSequence(val: array of SByte): RemObjects.Elements.System.INSFastEnumeration<nullable SByte>;
    class method int16ArrayToSequence(val: array of Int16): RemObjects.Elements.System.INSFastEnumeration<nullable Int16>;
    class method uint16ArrayToSequence(val: array of UInt16): RemObjects.Elements.System.INSFastEnumeration<nullable UInt16>;
    class method int32ArrayToSequence(val: array of Int32): RemObjects.Elements.System.INSFastEnumeration<nullable Int32>;
    class method uint32ArrayToSequence(val: array of UInt32): RemObjects.Elements.System.INSFastEnumeration<nullable UInt32>;
    class method int64ArrayToSequence(val: array of Int64): RemObjects.Elements.System.INSFastEnumeration<nullable Int64>;
    class method uint64ArrayToSequence(val: array of UInt64): RemObjects.Elements.System.INSFastEnumeration<nullable UInt64>;
    class method singleArrayToSequence(val: array of Single): RemObjects.Elements.System.INSFastEnumeration<nullable Single>;
    class method doubleArrayToSequence(val: array of Double): RemObjects.Elements.System.INSFastEnumeration<nullable Double>;

    class method getSubArray<T>(val: array of T; aStart, aLength: Integer): array of T;
    begin
      result := new T[aLength];
      for i := 0 to aLength-1 do
        result[i] := val[i+aStart];
    end;

    class method getSubArray<T>(val: array of T; aRange: Range): array of T;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new T[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of SByte; aRange: Range): array of SByte;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new SByte[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of Byte; aRange: Range): array of Byte;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Byte[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of Int16; aRange: Range): array of Int16;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Int16[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of UInt16; aRange: Range): array of UInt16;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new UInt16[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of Int32; aRange: Range): array of Int32;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Int32[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of UInt32; aRange: Range): array of UInt32;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new UInt32[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of Int64; aRange: Range): array of Int64;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Int64[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of UInt64; aRange: Range): array of UInt64;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new UInt64[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    //class method getSubArray<Single>(val: array of Single; aRange: Range): array of Single;
    //begin
      //var lLength := length(val);
      //var lStart := aRange.fStart.GetOffset(lLength);
      //var lEnd := aRange.fEnd.GetOffset(lLength);
      //result := new Single[lEnd-lStart];
      //for i := 0 to lEnd-lStart-1 do
        //result[i] := val[i+lStart];
    //end;

    //class method getSubArray<Double>(val: array of Double; aRange: Range): array of Double;
    //begin
      //var lLength := length(val);
      //var lStart := aRange.fStart.GetOffset(lLength);
      //var lEnd := aRange.fEnd.GetOffset(lLength);
      //result := new Double[lEnd-lStart];
      //for i := 0 to lEnd-lStart-1 do
        //result[i] := val[i+lStart];
    //end;

    class method getSubArray(val: array of Boolean; aRange: Range): array of Boolean;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Boolean[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of Char; aRange: Range): array of Char;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new Char[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;

    class method getSubArray(val: array of AnsiChar; aRange: Range): array of AnsiChar;
    begin
      var lLength := length(val);
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := new AnsiChar[lEnd-lStart];
      for i := 0 to lEnd-lStart-1 do
        result[i] := val[i+lStart];
    end;
  end;

  SimpleTypeIteratorMethod nested in ArrayUtils = method (aArray: ^Byte; aIndex: Integer): id;

  ArrayUtils__SimpleTypeIterator = class (INSFastEnumeration)
  private
    fArray: ^Byte;
    fIndex: Integer;
    fHelper: ArrayUtils.SimpleTypeIteratorMethod;
  public
    constructor(aArray: ^Byte; aHelper: ArrayUtils.SimpleTypeIteratorMethod);
    method countByEnumeratingWithState(state: ^NSFastEnumerationState) objects(buffer: ^id) count(len: NSUInteger): NSUInteger;
    finalizer;
  end;

implementation

class method ArrayUtils.idArrayToSequence(val: array of id): INSFastEnumeration;
begin
  for i: Integer := 0 to length(val) -1 do
    yield val[i];
end;

constructor ArrayUtils__SimpleTypeIterator(aArray: ^Byte; aHelper: ArrayUtils.SimpleTypeIteratorMethod);
begin
  fArray := aArray;
  fHelper := aHelper;
end;

method ArrayUtils__SimpleTypeIterator.countByEnumeratingWithState(state: ^NSFastEnumerationState) objects(buffer: ^id) count(len: NSUInteger): NSUInteger;
begin
  state^.itemsPtr := buffer;
  state^.mutationsPtr := @(state^.extra[0]);
  while len > 0 do begin
    var lRes := fHelper(fArray, fIndex);
    if lRes = nil then break;
    buffer^ := lRes;
    inc(buffer);
    inc(fIndex);
    dec(len);
    inc(result);
  end;
end;

finalizer ArrayUtils__SimpleTypeIterator;
begin
  fHelper(fArray, -1);
end;

class method ArrayUtils.genericArrayToSequence<T>(val: array of T): RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit RemObjects.Elements.System.INSFastEnumeration<T>(idArrayToSequence(array of id(val)));
end;

class method ArrayUtils.charArrayToSequence(val: array of AnsiChar): RemObjects.Elements.System.INSFastEnumeration<nullable AnsiChar>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of AnsiChar(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of AnsiChar(@lArr)^ := nil
                                                else if idx >= length(^array of AnsiChar(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of AnsiChar(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.intStringToSequence(val: String): INSFastEnumeration;
begin
  if val = nil then exit;
  for i: Integer := 0 to val.length -1 do
    yield val[i];
end;

class method ArrayUtils.stringToSequence(val: String): RemObjects.Elements.System.INSFastEnumeration<nullable Char>;
begin
  exit intStringToSequence(val)
end;

class method ArrayUtils.wcharArrayToSequence(val: array of Char): RemObjects.Elements.System.INSFastEnumeration<nullable Char>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Char(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Char(@lArr)^ := nil
                                                else if idx >= length(^array of AnsiChar(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Char(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.boolArrayToSequence(val: array of Boolean): RemObjects.Elements.System.INSFastEnumeration<nullable Boolean>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Boolean(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Boolean(@lArr)^ := nil
                                                else if idx >= length(^array of Boolean(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Boolean(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.byteArrayToSequence(val: array of Byte): RemObjects.Elements.System.INSFastEnumeration<nullable Byte>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Byte(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Byte(@lArr)^ := nil
                                                else if idx >= length(^array of Byte(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Byte(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.sbyteArrayToSequence(val: array of SByte): RemObjects.Elements.System.INSFastEnumeration<nullable SByte>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of SByte(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of SByte(@lArr)^ := nil
                                                else if idx >= length(^array of SByte(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of SByte(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.int16ArrayToSequence(val: array of Int16): RemObjects.Elements.System.INSFastEnumeration<nullable Int16>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Int16(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Int16(@lArr)^ := nil
                                                else if idx >= length(^array of Int16(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Int16(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.uint16ArrayToSequence(val: array of UInt16): RemObjects.Elements.System.INSFastEnumeration<nullable UInt16>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of UInt16(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of UInt16(@lArr)^ := nil
                                                else if idx >= length(^array of UInt16(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of UInt16(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.int32ArrayToSequence(val: array of Int32): RemObjects.Elements.System.INSFastEnumeration<nullable Int32>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Int32(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Int32(@lArr)^ := nil
                                                else if idx >= length(^array of Int32(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Int32(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.uint32ArrayToSequence(val: array of UInt32): RemObjects.Elements.System.INSFastEnumeration<nullable UInt32>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of UInt32(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of UInt32(@lArr)^ := nil
                                                else if idx >= length(^array of UInt32(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of UInt32(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.int64ArrayToSequence(val: array of Int64): RemObjects.Elements.System.INSFastEnumeration<nullable Int64>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Int64(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Int64(@lArr)^ := nil
                                                else if idx >= length(^array of Int64(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Int64(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.uint64ArrayToSequence(val: array of UInt64): RemObjects.Elements.System.INSFastEnumeration<nullable UInt64>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of UInt64(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of UInt64(@lArr)^ := nil
                                                else if idx >= length(^array of UInt64(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of UInt64(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.singleArrayToSequence(val: array of Single): RemObjects.Elements.System.INSFastEnumeration<nullable Single>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Single(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Single(@lArr)^ := nil
                                                else if idx >= length(^array of Single(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Single(@lArr)^[idx];
                                             end);
end;

class method ArrayUtils.doubleArrayToSequence(val: array of Double): RemObjects.Elements.System.INSFastEnumeration<nullable Double>;
begin
  if val = nil then exit nil;
  var p: ^Byte := nil;
  ^array of Double(@p)^ := val; // +ref
  exit new ArrayUtils__SimpleTypeIterator(p, method (arr: ^Byte; idx: Integer): id begin
                                               var lArr := arr;
                                               if idx = -1 then
                                                 ^array of Double(@lArr)^ := nil
                                                else if idx >= length(^array of Double(@lArr)^) then
                                                  exit nil
                                                else
                                                  exit ^array of Double(@lArr)^[idx];
                                             end);
end;

end.