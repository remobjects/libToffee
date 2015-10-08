namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  __ElementaBoxedStructDestructor = public procedure (o: ^Void);

  __ElementaBoxedStruct = public class(NSObject) // We're explicitly NOT implementing INSCopying and INSCoding
  private
    fValue: ^Void;
    fDtor: __ElementaBoxedStructDestructor;
  public
    constructor (aValue: ^Void; aDtor: __ElementaBoxedStructDestructor); // Presume already "copied" & malloced
    finalizer;
    method description: String; override;
    class method boxedStructWithValue(aValue: ^Void; aDtor: __ElementaBoxedStructDestructor): __ElementaBoxedStruct;
    class method valueForStruct(aStruct: NSObject; aDtor: __ElementaBoxedStructDestructor): ^Void;
    property Dtor: __ElementaBoxedStructDestructor read fDtor;
    property Value: ^Void read fValue;    
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;    
  end;

  __ElementaBoxedChar = public class(NSObject, INSCopying, INSCoding)
  public
    constructor withChar(aChar: Char);
    class method boxedCharWithChar(aChar: Char): __ElementaBoxedChar;
    method description: String; override;
    property charValue: Char; readonly;
    operator Implicit(aValue: __ElementaBoxedChar): NSNumber;
    operator Implicit(aValue: __ElementaBoxedChar): Char;
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

  __ElementaBoxedAnsiChar = public class(NSObject, INSCopying, INSCoding)
  public
    constructor withAnsiChar(aAnsiChar: AnsiChar);
    class method boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): __ElementaBoxedAnsiChar;
    method description: String; override;
    property ansiCharValue: AnsiChar; readonly;
    operator Implicit(aValue: __ElementaBoxedAnsiChar): NSNumber;
    operator Implicit(aValue: __ElementaBoxedAnsiChar): AnsiChar;
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

implementation

{ __ElementaBoxedChar }

constructor __ElementaBoxedChar withChar(aChar: Char);
begin
  charValue := aChar;
end;

method __ElementaBoxedChar.description: String;
begin
  result := NSString.stringWithFormat("%c", charValue);
end;

operator __ElementaBoxedChar.Implicit(aValue: __ElementaBoxedChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedInt(aValue.charValue as Int16);
end;

operator __ElementaBoxedChar.Implicit(aValue: __ElementaBoxedChar): Char;
begin
  result := aValue.charValue;
end;

class method __ElementaBoxedChar.boxedCharWithChar(aChar: Char): __ElementaBoxedChar;
begin
  exit new __ElementaBoxedChar withChar(aChar);
end;

method __ElementaBoxedChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := __ElementaBoxedChar.allocWithZone(zone).initWithChar(charValue) as not nullable;
end;

method __ElementaBoxedChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^Char := ^Char(aDecoder.decodeBytesWithReturnedLength(var len));
  charValue := ch^;
end;

method __ElementaBoxedChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := charValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ __ElementaBoxedAnsiChar }

constructor __ElementaBoxedAnsiChar withAnsiChar(aAnsiChar: AnsiChar);
begin
  ansiCharValue := aAnsiChar;
end;

method __ElementaBoxedAnsiChar.description: String;
begin
  result := NSString.stringWithFormat("%c", ansiCharValue);
end;

operator __ElementaBoxedAnsiChar.Implicit(aValue: __ElementaBoxedAnsiChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedChar(aValue.ansiCharValue as Byte);
end;

operator __ElementaBoxedAnsiChar.Implicit(aValue: __ElementaBoxedAnsiChar): AnsiChar;
begin
  result := aValue.ansiCharValue;
end;

class method __ElementaBoxedAnsiChar.boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): __ElementaBoxedAnsiChar;
begin
  exit new __ElementaBoxedAnsiChar withAnsiChar(aAnsiChar);
end;

method __ElementaBoxedAnsiChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := __ElementaBoxedAnsiChar.allocWithZone(zone).initWithAnsiChar(ansiCharValue) as not nullable;
end;

method __ElementaBoxedAnsiChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^AnsiChar := ^AnsiChar(aDecoder.decodeBytesWithReturnedLength(var len));
  ansiCharValue := ch^;
end;

method __ElementaBoxedAnsiChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := ansiCharValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ __ElementaBoxedStruct }

constructor __ElementaBoxedStruct(aValue: ^Void; aDtor: __ElementaBoxedStructDestructor);
begin
  fValue := aValue;
  fDtor := aDtor;
end;

finalizer __ElementaBoxedStruct;
begin
  if fDtor <> nil then
    fDtor(fValue);
  free(fValue);
end;

method __ElementaBoxedStruct.description: String;
begin
  result := "<Boxed Struct Type>"
end;

class method __ElementaBoxedStruct.boxedStructWithValue(aValue: ^Void; aDtor: __ElementaBoxedStructDestructor): __ElementaBoxedStruct;
begin
  exit new __ElementaBoxedStruct(aValue, aDtor);
end;

class method __ElementaBoxedStruct.valueForStruct(aStruct: Object; aDtor: __ElementaBoxedStructDestructor): ^Void;
begin
  var lSelf := __ElementaBoxedStruct(aStruct);
  if lSelf.Dtor <> aDtor then
    raise new NSException withName('InvalidCastException') reason ('Destructor does not match for boxed struct') userInfo(nil);
  exit lSelf.fValue;
end;

method __ElementaBoxedStruct.copyWithZone(zone: ^NSZone): not nullable id;
begin
  raise new NSException("NSCopying is not supported for boxed structs.")
end;

method __ElementaBoxedStruct.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

method __ElementaBoxedStruct.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

end.
