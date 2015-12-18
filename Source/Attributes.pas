namespace RemObjects.Elements.System;

interface

type
  Attribute = public class(Object)
  end;
  
  AttributeTargets = public flags (
    &Class = 1 shl 2,
    &Constructor = 1 shl 5,
    &Method = 1 shl 6,
    &Property = 1 shl 7,
    &Field = 1 shl 8,
    &Event = 1 shl 9,
    &Interface = 1 shl 10,
    &Parameter = 1 shl 11,
    &ReturnValue = 1 shl 13);
  AttributeUsageAttribute = public class(Attribute)
  public
    constructor (aValidOn: AttributeTargets); 
    property ValidOn: AttributeTargets; readonly;
  end;
  
implementation

constructor AttributeUsageAttribute(aValidOn: AttributeTargets);
begin
  ValidOn := aValidOn;
end;

end.
