namespace RemObjects.Elements.System;

interface
uses
  Foundation;

type
  __ElementsAttribute = public class(Object)
  end;
  Attribute = public __ElementsAttribute;
  
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
  __ElementsAttributeUsageAttribute = public class(Attribute)
  public
    constructor (aValidOn: AttributeTargets); 
    property ValidOn: AttributeTargets; readonly;
  end;
  AttributeUsageAttribute = public __ElementsAttributeUsageAttribute;

method __ElementsReadAttributes(var aAttributesPtr: ^Byte; aTargetParameter: Integer := 0; aTypeFilter: &Class): NSArray<Attribute>; public;
method __ElementsReadAttribute(aAttributesPtr, aEnd: ^Byte; aTargetParameter: Integer; aTypeFilter: &Class): Attribute; public;
method __ElementsGetAttributesBlockForFunction(aMethod: ^Void): ^Byte; public;
method __ElementsGetAttributesBlockForMethod(aClass: &Class; aInstance: Boolean; aSel: SEL): ^Byte; public;
  
implementation

constructor AttributeUsageAttribute(aValidOn: AttributeTargets);
begin
  ValidOn := aValidOn;
end;


method __ElementsReadAttribute(aAttributesPtr, aEnd: ^Byte; aTargetParameter: Integer; aTypeFilter: &Class): Attribute; 
begin
  var lInst: Attribute;
  
  var lTY: __Elements_ProtoReadType;
  var lKey: Integer;
  // type & ctor have to be in order.
  if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) or (lTY <> __Elements_ProtoReadType.length) or (lKey <> 0) then exit nil;
  var lRealType := objc_getClass(__Elements_ProtoReadString(var aAttributesPtr));
  if lRealType = nil then exit nil;
  if (aTypeFilter <> nil) and (aTypeFilter <> lRealType) then exit nil; 
  if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) or (lTY <> __Elements_ProtoReadType.length) or (lKey <> 1) then exit nil;
  var lSelector := NSSelectorFromString(__Elements_ProtoReadString(var aAttributesPtr));

  if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) or (lTY <> __Elements_ProtoReadType.varint) or (lKey <> 2) then exit nil;
  if __Elements_ProtoReadVarInt(var aAttributesPtr) <> aTargetParameter then exit nil;

  lInst := lRealType.alloc;
  var lSel := lInst.methodSignatureForSelector(lSelector);
  if lSel = nil then exit nil;
  var lInvoker := Foundation.NSInvocation.invocationWithMethodSignature(lSel);
  lInvoker.target := lInst;
  lInvoker.selector := lSelector;
  var lArgIdx: Integer := 2;
  
  while aAttributesPtr < aEnd do begin 
    if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) then break;
    case lKey of
      3: begin 
        if lTY <> __Elements_ProtoReadType.startgroup then begin  
          __Elements_ProtoSkipValue(var aAttributesPtr, lTY);
        end else begin
          loop begin
            var lParName: String;
            if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) then break;
            case lKey of 
              0: begin 
                lParName := __Elements_ProtoReadString(var aAttributesPtr);
                if lArgIdx <> 0 then begin 
                  lInvoker.invoke;
                  var lNewInst: unretained id;
                  lInvoker.getReturnValue(@lNewInst);
                  lInst := lNewInst;
                  lArgIdx := 0;
                end;
              end;
              1: begin 
                var lVal: Int64 := __Elements_ProtoReadVarInt(var aAttributesPtr);
                if lParName = nil then begin
                  lInvoker.setArgument(@lVal) atIndex(lArgIdx);
                  inc(lArgIdx)
                end else 
                  lInst.setValue(NSNumber.numberWithLongLong(lVal)) forKey(lParName);
              end;
              2: begin 
                var lVal: Double := __Elements_ProtoReadDouble(var aAttributesPtr);
                if lParName = nil then begin
                  if lInvoker.methodSignature.getArgumentTypeAtIndex(lArgIdx)^ = 'f' then begin 
                    // single
                    var lVal2: Single := lVal;
                    lInvoker.setArgument(@lVal2) atIndex(lArgIdx);
                  end else 
                    lInvoker.setArgument(@lVal) atIndex(lArgIdx);
                  inc(lArgIdx)
                end else 
                  lInst.setValue(NSNumber.numberWithDouble(lVal)) forKey(lParName);
              end;
               3: begin 
                var lVal: String := __Elements_ProtoReadString(var aAttributesPtr);
                if lParName = nil then begin
                  lInvoker.setArgument(@lVal) atIndex(lArgIdx);
                  inc(lArgIdx)
                end else 
                  lInst.setValue(lVal) forKey(lParName);
              end;
              else __Elements_ProtoSkipValue(var aAttributesPtr, lTY);
            end;
          end;
          continue;
        end;
      end;
    else
      __Elements_ProtoSkipValue(var aAttributesPtr, lTY);
    end;
  end;
  if lArgIdx <> 0 then begin 
    lInvoker.invoke;
    var lNewInst: unretained id;
    lInvoker.getReturnValue(@lNewInst);
    lInst := lNewInst;
  end;

  exit lInst;
end;

method __ElementsReadAttributes(var aAttributesPtr: ^Byte; aTargetParameter: Integer := 0; aTypeFilter: &Class): NSArray<Attribute>;
begin
  if aAttributesPtr = nil then exit nil;
  var lRes: NSMutableArray<Attribute>;
  loop begin
    var lTY: __Elements_ProtoReadType;
    var lKey: Integer;
    if not __Elements_ProtoReadHeader(var aAttributesPtr, out lKey, out lTY) or (lKey = 0) then break;
    case lKey of 
      1: begin 
        if lTY <> __Elements_ProtoReadType.message then break; // not a valid message
        var lLen := __Elements_ProtoReadFixed32(var aAttributesPtr);
        var lItem := __ElementsReadAttribute(aAttributesPtr, aAttributesPtr + lLen, aTargetParameter, aTypeFilter);
        aAttributesPtr := aAttributesPtr + lLen;
        if lItem <> nil then begin
          if lRes = nil then lRes := new NSMutableArray<Attribute>;
          lRes.addObject(lItem);
        end;
      end;
    else
      __Elements_ProtoSkipValue(var aAttributesPtr, lTY);
    end;
  end;
  exit lRes;
end;

method __ElementsGetAttributesBlockForFunction(aMethod: ^Void): ^Byte;
begin
  if aMethod = nil then exit nil;
  var lWork := ^Byte(aMethod) - 8 - sizeOf(^Byte);
  if (lWork[0]<> 'E') or (lWork[1] <> 'l') or (lWork[2] <> 'e') or (lWork[3] <> 'm') then exit nil;
  if (lWork[4]<> 'e') or (lWork[5] <> 'n') or (lWork[6] <> 't') or (lWork[7] <> 's') then exit nil;
  lWork := lWork + 8;
  exit (^^Byte(lWork))^;
end;

method __ElementsGetAttributesBlockForMethod(aClass: &Class; aInstance: Boolean; aSel: SEL): ^Byte;
begin
  exit __ElementsGetAttributesBlockForFunction(^Void(if aInstance then 
    aClass.instanceMethodForSelector(aSel)
  else
    aClass.methodForSelector(aSel)
  ));
end;

end.
