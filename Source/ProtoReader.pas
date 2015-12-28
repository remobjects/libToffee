namespace RemObjects.Elements.System;

interface


type
  __Elements_ProtoReadType = public (varint = 0, b64 = 1, length = 2, message = 3, b32 = 5, startgroup = 4, endgroup = 6);

method __Elements_ProtoReadHeader(var aSelf: ^Byte; out aKey: Integer; out aType: __Elements_ProtoReadType): Boolean;
method __Elements_ProtoReadVarInt(var aSelf: ^Byte): Int64;
method __Elements_ProtoSkipValue(var aSelf: ^Byte; aType: __Elements_ProtoReadType);
method __Elements_ProtoReadDouble(var aSelf: ^Byte): Double;
method __Elements_ProtoReadFixed32(var aSelf: ^Byte): Integer;
method __Elements_ProtoReadFixed64(var aSelf: ^Byte): Int64;
method __Elements_ProtoReadString(var aSelf: ^Byte): String;
method __Elements_ProtoReadBytes(var aSelf: ^Byte): array of Byte;

implementation

method __Elements_ProtoReadHeader(var aSelf: ^Byte; out aKey: Integer; out aType: __Elements_ProtoReadType): Boolean;
begin
  var lData := __Elements_ProtoReadVarInt(var aSelf);
  var lType := __Elements_ProtoReadType(lData and $7);
  aType := lType;
  aKey := lData shr 3;
  exit aType <> __Elements_ProtoReadType.endgroup;
end;

method __Elements_ProtoReadVarInt(var aSelf: ^Byte): Int64;
begin
  var lShift := 0;
  result := 0;
  loop begin
    var lData := aSelf^;
    inc(aSelf);
    result := result or (Int64(lData and $7f) shl lShift);
    lShift := lShift + 7;
    if 0 = (lData and $80) then break;
  end;
end;

method __Elements_ProtoSkipValue(var aSelf: ^Byte; aType: __Elements_ProtoReadType);
begin
  case aType of
    __Elements_ProtoReadType.b32: __Elements_ProtoReadFixed32(var aSelf);
    __Elements_ProtoReadType.b64: __Elements_ProtoReadFixed64(var aSelf);
    __Elements_ProtoReadType.message: aSelf := aSelf + __Elements_ProtoReadFixed32(var aSelf);
    __Elements_ProtoReadType.endgroup: ;
    __Elements_ProtoReadType.startgroup: begin 
      var lCount := 1;
      loop begin
        var lRT := __Elements_ProtoReadType(__Elements_ProtoReadVarInt(var aSelf) and $7);
        if lRT = __Elements_ProtoReadType.startgroup then 
          inc(lCount) 
        else
        if lRT = __Elements_ProtoReadType.endgroup then begin
          dec(lCount);
          if lCount = 0 then break;
        end else 
          __Elements_ProtoSkipValue(var aSelf, lRT);
      end;
    end;
    __Elements_ProtoReadType.length: aSelf := aSelf + __Elements_ProtoReadVarInt(var aSelf);
  else  __Elements_ProtoReadVarInt(var aSelf);
  end;
end;

method __Elements_ProtoReadDouble(var aSelf: ^Byte): Double;
begin
  result := ^Double(aSelf)^;
  aSelf := aSelf + 8;
end;

method __Elements_ProtoReadString(var aSelf: ^Byte): String;
begin
  var lLen := __Elements_ProtoReadVarInt(var aSelf);
  result := new Foundation.NSString withBytes(aSelf) length(lLen) encoding (Foundation.NSStringEncoding.UTF8StringEncoding);
  aSelf := aSelf + lLen;
end;

method __Elements_ProtoReadBytes(var aSelf: ^Byte): array of Byte;
begin
  var lLen := __Elements_ProtoReadVarInt(var aSelf);
  result := new Byte[lLen];
  memcpy(@result[0], aSelf, lLen);
  aSelf := aSelf + lLen;
end;

method __Elements_ProtoReadFixed32(var aSelf: ^Byte): Integer;
begin
  result := ^Integer(aSelf)^;
  aSelf := aSelf + 4;
end;

method __Elements_ProtoReadFixed64(var aSelf: ^Byte): Int64;
begin
  result := ^Int64(aSelf)^;
  aSelf := aSelf + 8;
end;


end.
