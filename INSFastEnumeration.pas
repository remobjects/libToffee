namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  INSFastEnumeration<T> = public interface mapped to Foundation.INSFastEnumeration 
    method countByEnumeratingWithState(aState: ^NSFastEnumerationState) objects(stackbuf: ^T) count(len: NSUInteger): NSUInteger; mapped to countByEnumeratingWithState(aState) objects(^id(stackbuf)) count(len);
  end;

implementation

end.
