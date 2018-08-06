namespace RemObjects.Elements.System;

uses
  Foundation;

[SwiftName("NSLocalizedString(key:, comment:)")]
method NSLocalizedString(aKey: String; aIgnoredComment: String): String; public; inline;
begin
  result := NSBundle.mainBundle.localizedStringForKey(aKey) value("") table(nil);
end;

method NSLocalizedStringFromTable(aKey: String; aTable: String; aIgnoredComment: String): String; public; inline;
begin
  result := NSBundle.mainBundle.localizedStringForKey(aKey) value("") table(aTable);
end;

method NSLocalizedStringFromTableInBundle(aKey: String; aTable: String; aBundle: NSBundle; aIgnoredComment: String): String; public; inline;
begin
  result := aBundle.mainBundle.localizedStringForKey(aKey) value("") table(aTable);
end;

method NSLocalizedStringWithDefaultValue(aKey: String; aTable: String; aBundle: NSBundle; aDefaultValue: String; aIgnoredComment: String): String; public; inline;
begin
  result := aBundle.mainBundle.localizedStringForKey(aKey) value(aDefaultValue) table(aTable);
end;

end.