namespace RemObjects.Elements.System;

uses
  Foundation;

[OmitFromHeader, SwiftName("NSLocalizedString(key:, comment:)")]
method NSLocalizedString(aKey: String; aIgnoredComment: String): String; public; inline;
begin
  result := NSBundle.mainBundle.localizedStringForKey(aKey) value("") table(nil);
end;

[OmitFromHeader]
method NSLocalizedStringFromTable(aKey: String; aTable: String; aIgnoredComment: String): String; public; inline;
begin
  result := NSBundle.mainBundle.localizedStringForKey(aKey) value("") table(aTable);
end;

[OmitFromHeader]
method NSLocalizedStringFromTableInBundle(aKey: String; aTable: String; aBundle: NSBundle; aIgnoredComment: String): String; public; inline;
begin
  result := aBundle.mainBundle.localizedStringForKey(aKey) value("") table(aTable);
end;

[OmitFromHeader]
method NSLocalizedStringWithDefaultValue(aKey: String; aTable: String; aBundle: NSBundle; aDefaultValue: String; aIgnoredComment: String): String; public; inline;
begin
  result := aBundle.mainBundle.localizedStringForKey(aKey) value(aDefaultValue) table(aTable);
end;

end.