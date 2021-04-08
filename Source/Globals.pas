namespace RemObjects.Elements.System;

operator Add(aLeft, aRight: NSDecimalNumber): NSDecimalNumber; public;
begin
  exit aLeft.decimalNumberByAdding(aRight);
end;

operator Subtract(aLeft, aRight: NSDecimalNumber): NSDecimalNumber; public;
begin
  exit aLeft.decimalNumberBySubtracting(aRight);
end;


operator Multiply(aLeft, aRight: NSDecimalNumber): NSDecimalNumber; public;
begin
  exit aLeft.decimalNumberByMultiplyingBy(aRight);
end;


operator Divide(aLeft, aRight: NSDecimalNumber): NSDecimalNumber; public;
begin
  exit aLeft.decimalNumberByDividingBy(aRight);
end;



operator Pow(a, b: Double): Double; public;
begin
  exit rtl.pow(a,b);
end;

operator Pow(a, b: Int64): Int64; public;
begin
  result := 1;
  if b < 0 then exit 0;
  while b <> 0 do begin
    if (b and 1) <> 0 then result := result * a;
    a := a * a;
    b := b shr 1;
  end;
end;

operator Pow(a, b: Integer): Integer; public;
begin
  result := 1;
  if b < 0 then exit 0;
  while b <> 0 do begin
    if (b and 1) <> 0 then result := result * a;
    a := a * a;
    b := b shr 1;
  end;
end;


end.