namespace RemObjects.Elements.System;

type
  Boolean_Extension = public extension class(Boolean)
  public

    method ToString: not nullable String;
    begin
      exit if self then 'true' else 'false';
    end;

  end;
end.
