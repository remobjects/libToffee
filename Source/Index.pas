namespace Remobjects.Elements.System;

type
  &Index = public record(IEquatable<&Index>)
  public

    class property Start: &Index read new &Index(0);
    class property &End: &Index read new &Index(not 0);

    property Value: Integer read
      begin
        if fValue < 0 then begin
          exit not fValue;
        end
        else begin
          exit fValue;
        end;
      end;

    property IsFromEnd: Boolean read fValue < 0;

    constructor(aValue: Integer; aFromEnd: Boolean := false);
    begin
      if aValue < 0 then begin
        raise new Exception("Index needs a non-negative number.");
      end;
      if aFromEnd then begin
        fValue := not aValue;
      end
      else begin
        fValue := aValue;
      end;
    end;

    class method FromStart(value: Integer): &Index;
    begin
      if value < 0 then begin
        raise new Exception("Index needs a non-negative number.");
      end;
      exit new &Index(value);
    end;

    class method FromEnd(value: Integer): &Index;
    begin
      if value < 0 then begin
        raise new Exception("Index needs a non-negative number.");
      end;
      exit new &Index(not value);
    end;

    method GetOffset(length: Integer): Integer;
    begin
      var offset: Integer := fValue;
      if IsFromEnd then begin
      //  offset = length - (~value)
      //  offset = length + (~(~value) + 1)
      //  offset = length + value + 1
        offset := offset + length + 1;
      end;
      exit offset;
    end;

    method &Equals(aValue: nullable &Index): Boolean;
    begin
      exit (aValue is &Index) and (fValue = &Index(aValue).fValue);
    end;

    // public bool Equals(Index other) => _value == other._value; // JE10 Automatically generated generic type adapter method for "RemObjects.Oxygene.System.Boolean Equals(Index other)" clashes with existing "RemObjects.Oxygene.System.Boolean Equals(Object? value)"
    // public override int GetHashCode() => _value;

    class operator Implicit(value: Integer): &Index;
    begin
      exit FromStart(value);
    end;

    [ToString]
    method description: String; override;
    begin
      if IsFromEnd then begin
        exit ToStringFromEnd();
      end;
      exit Int32(Value).description;
    end;

  private

  // The following private constructors mainly created for perf reason to avoid the checks
    constructor(aValue: Integer);
    begin
      fValue := aValue;
    end;

    method ToStringFromEnd: String;
    begin
      exit #94 + Value.description;
    end;

    var fValue: Integer;
  end;

end.