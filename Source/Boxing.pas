namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  __ElementsBoxedStructDestructor = public procedure (o: ^Void);

  __ElementsBoxedStruct = public class(NSObject) // We're explicitly NOT implementing INSCopying and INSCoding
  private
    fValue: ^Void;
    fDtor: __ElementsBoxedStructDestructor;
  public
    constructor (aValue: ^Void; aDtor: __ElementsBoxedStructDestructor); // Presume already "copied" & malloced
    finalizer;
    method description: String; override;
    class method boxedStructWithValue(aValue: ^Void; aDtor: __ElementsBoxedStructDestructor): __ElementsBoxedStruct;
    class method valueForStruct(aStruct: NSObject; aDtor: __ElementsBoxedStructDestructor): ^Void;
    property Dtor: __ElementsBoxedStructDestructor read fDtor;
    property Value: ^Void read fValue;
    { INSObject }
    method isEqual(object: id): Boolean; override;
    method isEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;    
  end;

  __ElementsBoxedChar = public class(NSObject, INSCopying, INSCoding)
  private
    method stringValue: NSString;
  public
    constructor withChar(aChar: Char);
    class method boxedCharWithChar(aChar: Char): __ElementsBoxedChar;
    method description: String; override;
    property charValue: Char; readonly;
    property stringValue: NSString read stringValue;
    operator Implicit(aValue: __ElementsBoxedChar): NSNumber;
    operator Implicit(aValue: __ElementsBoxedChar): Char;
    { INSObject }
    method isEqual(object: id): Boolean; override;
    method isEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isGreaterThan(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isGreaterThanOrEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isLessThan(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isLessThanOrEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

  __ElementsBoxedAnsiChar = public class(NSObject, INSCopying, INSCoding)
  private
    method stringValue: NSString;
  public
    constructor withAnsiChar(aAnsiChar: AnsiChar);
    class method boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): __ElementsBoxedAnsiChar;
    method description: String; override;
    property ansiCharValue: AnsiChar; readonly;
    property stringValue: NSString read stringValue;
    operator Implicit(aValue: __ElementsBoxedAnsiChar): NSNumber;
    operator Implicit(aValue: __ElementsBoxedAnsiChar): AnsiChar;
    { INSObject }
    method isEqual(object: id): Boolean; override;
    method isEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isGreaterThan(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isGreaterThanOrEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isLessThan(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    method isLessThanOrEqualTo(object: id): Boolean; {$IF OSX}override;{$ENDIF}
    { INSCopying }
    method copyWithZone(zone: ^NSZone): not nullable id;
    { INSCoding }
    method encodeWithCoder(aCoder: not nullable NSCoder);
    method initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
  end;

implementation

{ __ElementsBoxedChar }

constructor __ElementsBoxedChar withChar(aChar: Char);
begin
  charValue := aChar;
end;

method __ElementsBoxedChar.description: String;
begin
  result := NSString.stringWithFormat("%c", charValue);
end;

operator __ElementsBoxedChar.Implicit(aValue: __ElementsBoxedChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedInt(aValue.charValue as Int16);
end;

operator __ElementsBoxedChar.Implicit(aValue: __ElementsBoxedChar): Char;
begin
  result := aValue.charValue;
end;

class method __ElementsBoxedChar.boxedCharWithChar(aChar: Char): __ElementsBoxedChar;
begin
  exit new __ElementsBoxedChar withChar(aChar);
end;

method __ElementsBoxedChar.stringValue: NSString;
begin
  var char := charValue;
  result := NSString.stringWithCharacters(@char) length(1);
end;

method __ElementsBoxedChar.isEqual(object: id): Boolean;
begin
  result := isEqualTo(object)
end;

method __ElementsBoxedChar.isEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (charValue = (object as __ElementsBoxedChar).charValue)) or
            ((object is __ElementsBoxedAnsiChar) and (charValue = Char((object as __ElementsBoxedAnsiChar).ansiCharValue))) or
            ((object is NSString) and (stringValue = (object as NSString)));
end;

method __ElementsBoxedChar.isGreaterThan(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (charValue > (object as __ElementsBoxedChar).charValue)) or
            ((object is __ElementsBoxedAnsiChar) and (charValue > Char((object as __ElementsBoxedAnsiChar).ansiCharValue))) or
            ((object is NSString) and (stringValue > (object as NSString)));
end;

method __ElementsBoxedChar.isGreaterThanOrEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (charValue >= (object as __ElementsBoxedChar).charValue)) or
            ((object is __ElementsBoxedAnsiChar) and (charValue >= Char((object as __ElementsBoxedAnsiChar).ansiCharValue))) or
            ((object is NSString) and (stringValue >= (object as NSString)));
end;

method __ElementsBoxedChar.isLessThan(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (charValue < (object as __ElementsBoxedChar).charValue)) or
            ((object is __ElementsBoxedAnsiChar) and (charValue < Char((object as __ElementsBoxedAnsiChar).ansiCharValue))) or
            ((object is NSString) and (stringValue < (object as NSString)));
end;

method __ElementsBoxedChar.isLessThanOrEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (charValue <= (object as __ElementsBoxedChar).charValue)) or
            ((object is __ElementsBoxedAnsiChar) and (charValue <= Char((object as __ElementsBoxedAnsiChar).ansiCharValue))) or
            ((object is NSString) and (stringValue <= (object as NSString)));
end;

method __ElementsBoxedChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := __ElementsBoxedChar.allocWithZone(zone).initWithChar(charValue) as not nullable;
end;

method __ElementsBoxedChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^Char := ^Char(aDecoder.decodeBytesWithReturnedLength(var len));
  charValue := ch^;
end;

method __ElementsBoxedChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := charValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ __ElementsBoxedAnsiChar }

constructor __ElementsBoxedAnsiChar withAnsiChar(aAnsiChar: AnsiChar);
begin
  ansiCharValue := aAnsiChar;
end;

method __ElementsBoxedAnsiChar.description: String;
begin
  result := NSString.stringWithFormat("%c", ansiCharValue);
end;

operator __ElementsBoxedAnsiChar.Implicit(aValue: __ElementsBoxedAnsiChar): NSNumber;
begin
  result := NSNumber.numberWithUnsignedChar(aValue.ansiCharValue as Byte);
end;

operator __ElementsBoxedAnsiChar.Implicit(aValue: __ElementsBoxedAnsiChar): AnsiChar;
begin
  result := aValue.ansiCharValue;
end;

method __ElementsBoxedAnsiChar.stringValue: NSString;
begin
  var char := Char(ansiCharValue);
  result := NSString.stringWithCharacters(@char) length(1);
end;

method __ElementsBoxedAnsiChar.isEqual(object: id): Boolean;
begin
  result := isEqualTo(object)
end;

method __ElementsBoxedAnsiChar.isEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedAnsiChar) and (ansiCharValue = (object as __ElementsBoxedAnsiChar).ansiCharValue)) or
            ((object is __ElementsBoxedChar) and (Char(ansiCharValue) = (object as __ElementsBoxedChar).charValue)) or
            ((object is NSString) and (stringValue = (object as NSString)));
end;

method __ElementsBoxedAnsiChar.isGreaterThan(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (ansiCharValue > (object as __ElementsBoxedAnsiChar).ansiCharValue)) or
            ((object is __ElementsBoxedChar) and (Char(ansiCharValue) > (object as __ElementsBoxedChar).charValue)) or
            ((object is NSString) and (stringValue > (object as NSString)));
end;

method __ElementsBoxedAnsiChar.isGreaterThanOrEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (ansiCharValue >= (object as __ElementsBoxedAnsiChar).ansiCharValue)) or
            ((object is __ElementsBoxedChar) and (Char(ansiCharValue) >= (object as __ElementsBoxedChar).charValue)) or
            ((object is NSString) and (stringValue >= (object as NSString)));
end;

method __ElementsBoxedAnsiChar.isLessThan(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (ansiCharValue < (object as __ElementsBoxedAnsiChar).ansiCharValue)) or
            ((object is __ElementsBoxedChar) and (Char(ansiCharValue) < (object as __ElementsBoxedChar).charValue)) or
            ((object is NSString) and (stringValue < (object as NSString)));
end;

method __ElementsBoxedAnsiChar.isLessThanOrEqualTo(object: id): Boolean;
begin
  result := ((object is __ElementsBoxedChar) and (ansiCharValue <= (object as __ElementsBoxedAnsiChar).ansiCharValue)) or
            ((object is __ElementsBoxedChar) and (Char(ansiCharValue) <= (object as __ElementsBoxedChar).charValue)) or
            ((object is NSString) and (stringValue <= (object as NSString)));
end;

class method __ElementsBoxedAnsiChar.boxedAnsiCharWithAnsiChar(aAnsiChar: AnsiChar): __ElementsBoxedAnsiChar;
begin
  exit new __ElementsBoxedAnsiChar withAnsiChar(aAnsiChar);
end;

method __ElementsBoxedAnsiChar.copyWithZone(zone: ^NSZone): not nullable id;
begin
  result := __ElementsBoxedAnsiChar.allocWithZone(zone).initWithAnsiChar(ansiCharValue) as not nullable;
end;

method __ElementsBoxedAnsiChar.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  var len: NSUInteger;
  var ch: ^AnsiChar := ^AnsiChar(aDecoder.decodeBytesWithReturnedLength(var len));
  ansiCharValue := ch^;
end;

method __ElementsBoxedAnsiChar.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  var ch := ansiCharValue;
  aCoder.encodeBytes(@ch) length(2);
end;

{ __ElementsBoxedStruct }

constructor __ElementsBoxedStruct(aValue: ^Void; aDtor: __ElementsBoxedStructDestructor);
begin
  fValue := aValue;
  fDtor := aDtor;
end;

finalizer __ElementsBoxedStruct;
begin
  if fDtor <> nil then
    fDtor(fValue);
  free(fValue);
end;

method __ElementsBoxedStruct.description: String;
begin
  result := "<Boxed Struct Type>"
end;

class method __ElementsBoxedStruct.boxedStructWithValue(aValue: ^Void; aDtor: __ElementsBoxedStructDestructor): __ElementsBoxedStruct;
begin
  exit new __ElementsBoxedStruct(aValue, aDtor);
end;

class method __ElementsBoxedStruct.valueForStruct(aStruct: Object; aDtor: __ElementsBoxedStructDestructor): ^Void;
begin
  var lSelf := __ElementsBoxedStruct(aStruct);
  if lSelf.Dtor <> aDtor then
    raise new NSException withName('InvalidCastException') reason ('Destructor does not match for boxed struct') userInfo(nil);
  exit lSelf.fValue;
end;

{ INSObject }
method __ElementsBoxedStruct.isEqual(object: id): Boolean;
begin
  result := false;
end;

method __ElementsBoxedStruct.isEqualTo(object: id): Boolean;
begin
  result := false;
end;

method __ElementsBoxedStruct.copyWithZone(zone: ^NSZone): not nullable id;
begin
  raise new NSException("NSCopying is not supported for boxed structs.")
end;

method __ElementsBoxedStruct.initWithCoder(aDecoder: not nullable NSCoder): nullable instancetype;
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

method __ElementsBoxedStruct.encodeWithCoder(aCoder: not nullable NSCoder);
begin
  raise new NSException("Encoding/decoding is not supported for boxed structs.")
end;

end.
