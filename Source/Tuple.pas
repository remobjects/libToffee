namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  &Tuple1<T1> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
  end;
  
  &Tuple2<T1, T2> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2 read duck<T2>(Tuple.Unwrap(mapped[1]));
  end;
  
  &Tuple3<T1, T2, T3> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
  end;
 
  &Tuple4<T1, T2, T3, T4> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
    property Item4: T4  read duck<T4>(Tuple.Unwrap(mapped[3]));
  end;
 
  &Tuple5<T1, T2, T3, T4, T5> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
    property Item4: T4  read duck<T4>(Tuple.Unwrap(mapped[3]));
    property Item5: T5  read duck<T5>(Tuple.Unwrap(mapped[4]));
  end;
  
  &Tuple6<T1, T2, T3, T4, T5, T6> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
    property Item4: T4  read duck<T4>(Tuple.Unwrap(mapped[3]));
    property Item5: T5  read duck<T5>(Tuple.Unwrap(mapped[4]));
    property Item6: T6  read duck<T6>(Tuple.Unwrap(mapped[5]));
  end;
  
  &Tuple7<T1, T2, T3, T4, T5, T6, T7> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
    property Item4: T4  read duck<T4>(Tuple.Unwrap(mapped[3]));
    property Item5: T5  read duck<T5>(Tuple.Unwrap(mapped[4]));
    property Item6: T6  read duck<T6>(Tuple.Unwrap(mapped[5]));
    property Item7: T7  read duck<T7>(Tuple.Unwrap(mapped[6]));
  end;
  
  &Tuple8<T1, T2, T3, T4, T5, T6, T7, T8> = public class mapped to Foundation.NSArray
  public
    property Item1: T1 read duck<T1>(Tuple.Unwrap(mapped[0]));
    property Item2: T2  read duck<T2>(Tuple.Unwrap(mapped[1]));
    property Item3: T3  read duck<T3>(Tuple.Unwrap(mapped[2]));
    property Item4: T4  read duck<T4>(Tuple.Unwrap(mapped[3]));
    property Item5: T5  read duck<T5>(Tuple.Unwrap(mapped[4]));
    property Item6: T6  read duck<T6>(Tuple.Unwrap(mapped[5]));
    property Item7: T7  read duck<T7>(Tuple.Unwrap(mapped[6]));
    property Item8: T8  read duck<T8>(Tuple.Unwrap(mapped[7]));
  end;
    
  Tuple = public static class
  assembly
    class method Unwrap(val: id): id; inline;
    class method Wrap(val: id): id;inline;
  public
     class method &New<T1>(aItem1: T1): &Tuple1<T1>; inline;
     class method &New<T1, T2>(aItem1: T1; aItem2: T2): &Tuple2<T1, T2>;inline;
     class method &New<T1, T2, T3>(aItem1: T1; aItem2: T2; aItem3: T3): &Tuple3<T1, T2, T3>;inline;
     class method &New<T1, T2, T3, T4>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4): &Tuple4<T1, T2, T3, T4>;inline;
     class method &New<T1, T2, T3, T4, T5>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5): &Tuple5<T1, T2, T3, T4, T5>;inline;
     class method &New<T1, T2, T3, T4, T5, T6>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6): &Tuple6<T1, T2, T3, T4, T5, T6>;inline;
     class method &New<T1, T2, T3, T4, T5, T6, T7>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6; aItem7: T7): &Tuple7<T1, T2, T3, T4, T5, T6, T7>;inline;
     class method &New<T1, T2, T3, T4, T5, T6, T7, T8>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6; aItem7: T7; aItem8: T8): &Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>;inline;
  end;

implementation

class method Tuple.Unwrap(val: id): id; 
begin
  if val = NSNull.null then exit nil else exit val;
end;

class method Tuple.Wrap(val: id): id;
begin
  exit coalesce(val, NSNull.null);
end;

class method Tuple.&New<T1>(aItem1: T1): &Tuple1<T1>;
begin
   exit &Tuple1<T1>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), nil));
end;

class method Tuple.&New<T1, T2>(aItem1: T1; aItem2: T2): &Tuple2<T1, T2>;
begin
   exit &Tuple2<T1, T2>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), nil));
end;

class method Tuple.&New<T1, T2, T3>(aItem1: T1; aItem2: T2; aItem3: T3): &Tuple3<T1, T2, T3>;
begin
   exit &Tuple3<T1, T2, T3>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), nil));
end;

class method Tuple.&New<T1, T2, T3, T4>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4): &Tuple4<T1, T2, T3, T4>;
begin
   exit &Tuple4<T1, T2, T3, T4>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), Wrap(aItem4), nil));
end;

class method Tuple.&New<T1, T2, T3, T4, T5>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5): &Tuple5<T1, T2, T3, T4, T5>;
begin
   exit &Tuple5<T1, T2, T3, T4, T5>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), Wrap(aItem4), Wrap(aItem5), nil));
end;

class method Tuple.&New<T1, T2, T3, T4, T5, T6>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6): &Tuple6<T1, T2, T3, T4, T5, T6>;
begin
   exit &Tuple6<T1, T2, T3, T4, T5, T6>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), Wrap(aItem4), Wrap(aItem5), Wrap(aItem6), nil));
end;

class method Tuple.&New<T1, T2, T3, T4, T5, T6, T7>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6; aItem7: T7): &Tuple7<T1, T2, T3, T4, T5, T6, T7>;
begin
 exit &Tuple7<T1, T2, T3, T4, T5, T6, T7>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), Wrap(aItem4), Wrap(aItem5), Wrap(aItem6), Wrap(aItem7), nil));
end;

class method Tuple.&New<T1, T2, T3, T4, T5, T6, T7, T8>(aItem1: T1; aItem2: T2; aItem3: T3;  aItem4: T4; aItem5: T5; aItem6: T6; aItem7: T7; aItem8: T8): &Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>;
begin
 exit &Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>(Foundation.NSArray.arrayWithObjects(Wrap(aItem1), Wrap(aItem2), Wrap(aItem3), Wrap(aItem4), Wrap(aItem5), Wrap(aItem6), Wrap(aItem7), Wrap(aItem8), nil));
end;

end.