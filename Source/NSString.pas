namespace RemObjects.Elements.System;

uses
  Foundation;

type
  NSString_Extension = public extension class(NSString)
  public

    property Item[i: Integer]: Char read self.characterAtIndex(i); default;
    property Item[i: &Index]: Char read self.characterAtIndex(i.GetOffset(length)); default;
    property Item[r: Range]: String read getSubstringWithRange(r); default;

  private

    method getSubstringWithRange(aRange: Range): NSString;
    begin
      var lLength := self.length;
      var lStart := aRange.fStart.GetOffset(lLength);
      var lEnd := aRange.fEnd.GetOffset(lLength);
      result := substringWithRange(NSMakeRange(lStart, lEnd-lStart));
    end;

  end;

end.