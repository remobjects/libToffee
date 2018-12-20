namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSException_Toffee = public extension class (NSException)
  private
  protected
  public
    constructor(aMessage: String);
  end;

implementation

constructor NSException_Toffee(aMessage: String);
begin
  var lClass := self.class.description; // Can't be inlined as self is set to nil during the init call.
  result := self.initWithName(lClass) reason(aMessage) userInfo(nil);
end;

end.