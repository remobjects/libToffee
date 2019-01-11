namespace RemObjects.Elements.System;

uses
  Foundation;

type
  NSException_Toffee = public extension class (NSException)
  private
  protected
  public

    constructor(aMessage: String);
    begin
      var lClass := self.class.description; // Can't be inlined as self is set to nil during the init call.
      result := self.initWithName(lClass) reason(aMessage) userInfo(nil);
    end;

    constructor withError(aError: NSError);
    begin
      result := new Exception withName('Exception') reason(aError.description) userInfo(nil);
    end;

    property Message: String read reason;
  end;

end.