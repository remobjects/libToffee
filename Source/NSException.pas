namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSException_Toffee = public extension class (NSException)
  private
  protected
  public
    method init(aMessage: String): instancetype;
  end;

implementation

method NSException_Toffee.init(aMessage: String): instancetype;
begin
  var lClass := self.class.description; // Can't be inlined as self is set to nil during the init call.
  result := self.initWithName(lClass) reason(aMessage) userInfo(nil);
end;

end.