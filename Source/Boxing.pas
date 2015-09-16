namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  BoxedStructDestructor = public procedure (o: ^Void);

  BoxedStruct = public class(NSObject) // We're explicitly NOT implementing INSCopying and INSCoding
  private
    fValue: ^Void;
    fDtor: BoxedStructDestructor;
  public
    constructor (aValue: ^Void; aDtor: BoxedStructDestructor); // Presume already "copied" & malloced
    finalizer;
    method description: String; override;
    class method boxedStructWithValue(aValue: ^Void; aDtor: BoxedStructDestructor): BoxedStruct;
    class method valueForStruct(aStruct: NSObject; aDtor: BoxedStructDestructor): ^Void;
    property Dtor: BoxedStructDestructor read fDtor;
    property Value: ^Void read fValue;    
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;    
  end;

  BoxedChar = public class(NSObject, INSCopying, INSCoding)
  public
    constructor withChar(aChar: Char);
    class method boxedCharWithChar(aChar: Char): BoxedChar;
    method description: String; override;
    property charValue: Char; readonly;
    operator Implicit(aValue: BoxedChar): NSNumber;
    operator Implicit(aValue: BoxedChar): Char;
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

  BoxedAnsiChar = public class(NSObject, INSCopying, INSCoding)
  public
    constructor withAnsiChar(aAnsiChar: AnsiChar);
    class method boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): BoxedAnsiChar;
    method description: String; override;
    property ansiCharValue: AnsiChar; readonly;
    operator Implicit(aValue: BoxedAnsiChar): NSNumber;
    operator Implicit(aValue: BoxedAnsiChar): AnsiChar;
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

implementation

{ BoxedChar }

constructor BoxedChar withChar(aChar: Char);
begin
  charValue := aChar;
end;

method BoxedChar.description: String;
begin
  result := NSString.stringWithFormat("%c", charValue);
end;

operator BoxedChar.Implicit(aValue: BoxedChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedInt(aValue.charValue as Int16);
end;

operator BoxedChar.Implicit(aValue: BoxedChar): Char;
begin
  result := aValue.charValue;
end;

class method BoxedChar.boxedCharWithChar(aChar: Char): BoxedChar;
begin
  exit new BoxedChar withChar(aChar);
end;

method BoxedChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := BoxedChar.allocWithZone(zone).initWithChar(charValue) as not nullable;
end;

method BoxedChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^Char := ^Char(aDecoder.decodeBytesWithReturnedLength(var len));
  charValue := ch^;
end;

method BoxedChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := charValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ BoxedAnsiChar }

constructor BoxedAnsiChar withAnsiChar(aAnsiChar: AnsiChar);
begin
  ansiCharValue := aAnsiChar;
end;

method BoxedAnsiChar.description: String;
begin
  result := NSString.stringWithFormat("%c", ansiCharValue);
end;

operator BoxedAnsiChar.Implicit(aValue: BoxedAnsiChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedChar(aValue.ansiCharValue as Byte);
end;

operator BoxedAnsiChar.Implicit(aValue: BoxedAnsiChar): AnsiChar;
begin
  result := aValue.ansiCharValue;
end;

class method BoxedAnsiChar.boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): BoxedAnsiChar;
begin
  exit new BoxedAnsiChar withAnsiChar(aAnsiChar);
end;

method BoxedAnsiChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := BoxedAnsiChar.allocWithZone(zone).initWithAnsiChar(ansiCharValue) as not nullable;
end;

method BoxedAnsiChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^AnsiChar := ^AnsiChar(aDecoder.decodeBytesWithReturnedLength(var len));
  ansiCharValue := ch^;
end;

method BoxedAnsiChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := ansiCharValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ BoxedStruct }

constructor BoxedStruct(aValue: ^Void; aDtor: BoxedStructDestructor);
begin
  fValue := aValue;
  fDtor := aDtor;
end;

finalizer BoxedStruct;
begin
  if fDtor <> nil then
    fDtor(fValue);
  free(fValue);
end;

method BoxedStruct.description: String;
begin
  result := "<Boxed Struct Type>"
end;

class method BoxedStruct.boxedStructWithValue(aValue: ^Void; aDtor: BoxedStructDestructor): BoxedStruct;
begin
  exit new BoxedStruct(aValue, aDtor);
end;

class method BoxedStruct.valueForStruct(aStruct: Object; aDtor: BoxedStructDestructor): ^Void;
begin
  var lSelf := BoxedStruct(aStruct);
  if lSelf.Dtor <> aDtor then
    raise new NSException withName('InvalidCastException') reason ('Destructor does not match for boxed struct') userInfo(nil);
  exit lSelf.fValue;
end;

method BoxedStruct.copyWithZone(zone: ^NSZone): not nullable id;
begin
  raise new NSException("NSCopying is not supported for boxed structs.")
end;

method BoxedStruct.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

method BoxedStruct.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

end.
