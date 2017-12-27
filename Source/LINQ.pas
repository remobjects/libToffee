namespace RemObjects.Elements.Linq;

interface

uses
  Foundation;

[assembly: NamespaceAlias('Linq', ['RemObjects.Elements.Linq'])]

type
  PredicateBlock = public block(aItem: not nullable id): Boolean;
  IDBlock = public block(aItem: not nullable id): id;
  ForSelector<T> = public delegate(aIndex: Integer): T;

  IGrouping<K,T> = public interface(RemObjects.Elements.System.INSFastEnumeration<T>)
    property Key: K read;
  end;

// Standard Linq Operators
extension method Foundation.INSFastEnumeration.Where(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.Any(): Boolean; public;
extension method Foundation.INSFastEnumeration.Any(aBlock: not nullable PredicateBlock): Boolean; public;
extension method Foundation.INSFastEnumeration.Take(aCount: NSInteger): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.Skip(aCount: NSInteger): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.TakeWhile(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration;  iterator; public;
extension method Foundation.INSFastEnumeration.SkipWhile(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration;  iterator; public;

extension method Foundation.INSFastEnumeration.OrderBy(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.OrderByDescending(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration; iterator; public;

extension method Foundation.INSFastEnumeration.GroupBy(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration; iterator; public;

extension method Foundation.INSFastEnumeration.Select(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.OfType<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>; iterator; public;
extension method Foundation.INSFastEnumeration.Cast<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>; iterator; public;

extension method Foundation.INSFastEnumeration.Concat(aSecond: not nullable Foundation.INSFastEnumeration): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.Reverse: not nullable Foundation.INSFastEnumeration; iterator; public;

extension method Foundation.INSFastEnumeration.Distinct(aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.Intersect(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration; iterator; public;
extension method Foundation.INSFastEnumeration.Except(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration; iterator; public;

extension method Foundation.INSFastEnumeration.Contains(aItem: id): Boolean; public;
extension method Foundation.INSFastEnumeration.FirstOrDefault: nullable id; public;
extension method Foundation.INSFastEnumeration.FirstOrDefault(aBlock: not nullable PredicateBlock): nullable id; public;
extension method Foundation.INSFastEnumeration.Count: NSInteger; public;

extension method Foundation.INSFastEnumeration.Max: id; public;
extension method Foundation.INSFastEnumeration.Max(aBlock: not nullable IDBlock): id; public;
extension method Foundation.INSFastEnumeration.Min: id; public;
extension method Foundation.INSFastEnumeration.Min(aBlock: not nullable IDBlock): id; public;

// Generic:

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Where(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Any(): Boolean; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Any(aBlock: not nullable block(aItem: not nullable T): Boolean): Boolean; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Take(aCount: NSInteger): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Skip(aCount: NSInteger): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.TakeWhile(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.SkipWhile(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.OrderBy(aBlock: not nullable block(aItem: not nullable T): id): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.OrderByDescending(aBlock: not nullable block(aItem: not nullable T): id): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.GroupBy<T,K>(aBlock: not nullable block(aItem: not nullable T): K): not nullable RemObjects.Elements.System.INSFastEnumeration<IGrouping<K,T>>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Select<T, R>(aBlock: not nullable block(aItem: not nullable T): R): not nullable RemObjects.Elements.System.INSFastEnumeration<R>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.OfType<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Cast<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Concat(aSecond: not nullable RemObjects.Elements.System.INSFastEnumeration<T>): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Reverse: not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Distinct(aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Intersect(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Except(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Contains(aItem: T): Boolean; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.FirstOrDefault: {nullable} T; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.FirstOrDefault(aBlock: not nullable block(aItem: not nullable T): Boolean): {nullable} T; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Count: NSInteger; inline; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Max: T; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Max<T,R>(aBlock: not nullable block(aItem: not nullable T): R): R; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Min: T; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.Min<T,R>(aBlock: not nullable block(aItem: not nullable T): R): R; inline; public;

// Join
// GroupJoin
// ThenBy
// GroupBy

// Union

// Useful helper methods
extension method Foundation.INSFastEnumeration.array: not nullable NSArray; public;
extension method Foundation.INSFastEnumeration.dictionary(aKeyBlock: IDBlock; aValueBlock: IDBlock): not nullable NSDictionary; public;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.array: not nullable NSArray<T>; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.dictionary(aKeyBlock: block(aItem: id): id; aValueBlock: block(aItem: id): id): not nullable NSDictionary; inline; public;
extension method RemObjects.Elements.System.INSFastEnumeration<T>.dictionary<T,K,V>(aKeyBlock: block(aItem: T): K; aValueBlock: block(aItem: T): V): not nullable NSDictionary<K, V>; inline; public;

// Internal Helpers
extension method Foundation.INSFastEnumeration.orderBy(aBlock: not nullable block(aItem: id): id) comparator(aComparator: NSComparator): not nullable Foundation.INSFastEnumeration; public;
//extension method NSArray.orderBy(aBlock: not nullable block(aItem: id): Int32; aComparator: NSComparator): not nullable Foundation.INSFastEnumeration; //iterator; public;

type
  //
  //
  // CAUTION: Magic type name.
  // The compiler will use __Toffee_Linq_Helpers() to assist with LINQ support
  //
  //
  __Toffee_Linq_Helpers = public static class
  private
    class method IntForHelper(aStart, aEnd, aStep: Integer; aBackward: Boolean; aMethod: ForSelector<id>): not nullable INSFastEnumeration; iterator;
  public
    class method ForHelper<T>(aStart, aEnd, aStep: Integer; aBackward: Boolean; aMethod: ForSelector<T>): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
  end;

implementation

{$GLOBALS ON}
const LOOP_SIZE = 16;
{$GLOBALS OFF}

//
// Where
//

extension method Foundation.INSFastEnumeration.Where(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration;
begin
  for each i in self do
    if aBlock(i) then yield i;
end;

extension method Foundation.INSFastEnumeration.Any(aBlock: not nullable PredicateBlock): Boolean;
begin
  for each i in self do
    if aBlock(i) then exit true;
end;

extension method Foundation.INSFastEnumeration.Take(aCount: NSInteger): not nullable Foundation.INSFastEnumeration;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObjects: array[0..LOOP_SIZE-1] of id;

  var lCount := 0;
  while lCount < aCount do begin
    var lNext := if aCount-lCount < 16 then aCount-lCount else LOOP_SIZE; //MIN(aCount-lCount, 16);
    var lGot := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(lObjects) count(lNext); //cast is workaround, remove;
    if lGot = 0 then break;
    if lGot > lNext then lGot := lNext;
    for i: NSInteger := 0 to lGot-1 do
      yield lState.itemsPtr[i];
    lCount := lCount+lGot;
  end;
end;

extension method Foundation.INSFastEnumeration.Skip(aCount: NSInteger): not nullable Foundation.INSFastEnumeration;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObjects: array[0..LOOP_SIZE-1] of id;

  var lCount := 0;
  loop begin
    var lNext := LOOP_SIZE;
    var lGot := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(lObjects) count(lNext); //cast is workaround, remove;
    if lGot = 0 then break;
    for i: NSInteger := 0 to lGot-1 do begin
      if lCount < aCount then
        inc(lCount)
      else
        yield lState.itemsPtr[i];
    end;
  end;
end;

extension method Foundation.INSFastEnumeration.TakeWhile(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObjects: array[0..LOOP_SIZE] of id;

  loop begin
    var lGot := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(lObjects) count(LOOP_SIZE); //cast is workaround, remove;
    if lGot = 0 then break;
    for i: NSInteger := 0 to lGot-1 do begin
      if not aBlock(lState.itemsPtr[i]) then exit;
      yield lState.itemsPtr[i];
    end;
  end;
end;

// Segmentation fault: 11: 65577: Toffee: Passing "array of id" to ^id parameter
extension method Foundation.INSFastEnumeration.SkipWhile(aBlock: not nullable PredicateBlock): not nullable Foundation.INSFastEnumeration;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObjects: array[0..LOOP_SIZE-1] of id;

  var lFound := false;
  loop begin
    var lGot := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(lObjects) count(LOOP_SIZE); //cast is workaround, remove;
    if lGot = 0 then break;
    for i: NSInteger := 0 to lGot-1 do begin
      if not lFound then
        if not aBlock(lState.itemsPtr[i]) then lFound := true;
      if lFound then
        yield lState.itemsPtr[i];
    end;
  end;
end;

//
// Order by
//

extension method Foundation.INSFastEnumeration.orderBy(aBlock: not nullable block(aItem: id): id) comparator(aComparator: NSComparator): not nullable Foundation.INSFastEnumeration;
begin
  result := self.array().sortedArrayUsingComparator(aComparator);
end;

extension method Foundation.INSFastEnumeration.OrderBy(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration;
begin
  var lOrdered := orderBy(aBlock) comparator( (a,b) -> begin
      var va := aBlock(a);
      var vb := aBlock(b);
      if va = nil then
        if vb = nil then exit NSComparisonResult.OrderedSame else exit NSComparisonResult.OrderedAscending;
      if vb = nil then exit NSComparisonResult.OrderedDescending;
      exit va.compare(vb)
    end);
  for each i in lOrdered do
    yield i;
end;

extension method Foundation.INSFastEnumeration.OrderByDescending(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration;
begin
  var lOrdered := orderBy(aBlock) comparator( (a,b) -> begin
      var va := aBlock(a);
      var vb := aBlock(b);
      if va = nil then
        if vb = nil then exit NSComparisonResult.OrderedSame else exit NSComparisonResult.OrderedDescending;
        if vb = nil then exit NSComparisonResult.OrderedAscending;
      exit vb.compare(va)
    end);
  for each i in lOrdered do
    yield i;
end;

type
  Grouping<K,T> = class(IGrouping<K,T>)
  private
    var fArray := new NSMutableArray; implements RemObjects.Elements.System.INSFastEnumeration<T>;
  unit
    method addObject(aValue: T);
    begin
      fArray.addObject(aValue);
    end;
  public
    property Key: K read unit write;
  end;

extension method Foundation.INSFastEnumeration.GroupBy(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration;
begin
  var lDictionary := new NSMutableDictionary;
  for each i in self do begin
    var lKey := aBlock(i);
    var lGrouping: Grouping<id,id> := lDictionary[lKey];
    if not assigned(lGrouping) then begin
      lGrouping := new Grouping<id,id>();
      lGrouping.Key := lKey;
      lDictionary[lKey] := lGrouping;
    end;
    lGrouping.addObject(i);
  end;
  for each g in lDictionary.allValues do
    yield g;
end;

//
// Select
//
extension method Foundation.INSFastEnumeration.Select(aBlock: not nullable IDBlock): not nullable Foundation.INSFastEnumeration;
begin
  for each i in self do
    yield aBlock(i);
end;

extension method Foundation.INSFastEnumeration.OfType<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>;
begin
  for each i in self do begin
    var i2 := R(i);
    if assigned(i2) then
      yield i2;
  end;
end;

extension method Foundation.INSFastEnumeration.Cast<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>;
begin
  for each i in self do
    yield i as R;
end;

//
//
//
extension method Foundation.INSFastEnumeration.Concat(aSecond: not nullable Foundation.INSFastEnumeration): not nullable Foundation.INSFastEnumeration;
begin
  for each i in self do
    yield i;
  if assigned(aSecond) then
    for each i in aSecond do
      yield i;
end;

extension method Foundation.INSFastEnumeration.Reverse: not nullable Foundation.INSFastEnumeration;
begin
  var lArray := self.array();
  for i: NSInteger := lArray.count-1 downto 0 do
    yield lArray[i];
end;

//
// Set Operators
//
extension method Foundation.INSFastEnumeration.Distinct(aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration;
begin
  var lReturned := new NSMutableArray;
  for each i in self do
    if not lReturned.containsObject(i) then begin
      lReturned.addObject(i);
      yield i;
    end;
end;

extension method Foundation.INSFastEnumeration.Intersect(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration;
begin
  var lSecond := aSecond.array();
  for each i in self do
    if lSecond.containsObject(i) then
      yield i;
end;

extension method Foundation.INSFastEnumeration.Except(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable Foundation.INSFastEnumeration;
begin
  var lFirst := self.Distinct().array();
  var lSecond := aSecond.Distinct().array();
  for each i in lFirst do
    if not lSecond.containsObject(i) then
      yield i;
  for each i in lSecond do
    if not lFirst.containsObject(i) then
      yield i;
end;


//
// Helpers
//

extension method Foundation.INSFastEnumeration.array(): not nullable NSArray;
begin
  if (self is NSArray) then exit self as NSArray;

  result := new NSMutableArray;
  for each i in self do
    NSMutableArray(result).addObject(i);
end;

extension method Foundation.INSFastEnumeration.dictionary(aKeyBlock: IDBlock; aValueBlock: IDBlock): not nullable NSDictionary;
begin
  var lArray := self.array();
  result := new NSMutableDictionary withCapacity(lArray.count);
  for each i in lArray do
    NSMutableDictionary(result)[aKeyBlock(i)] := aValueBlock(i);
end;

extension method Foundation.INSFastEnumeration.Contains(aItem: id): Boolean;
begin
  if self is NSArray then
    exit (self as NSArray).containsObject(aItem);
  for each i in self do begin
    if (i = nil) then begin
      if (aItem = nil) then exit true;
    end
    else begin
      if i.isEqual(aItem) then exit true;
    end;
  end;
end;

extension method Foundation.INSFastEnumeration.FirstOrDefault(): nullable id;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObject: id;
  if Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(var lObject) count(1) ≥ 1 then //cast is workaround, remove;
    result := lState.itemsPtr[0];
end;

extension method Foundation.INSFastEnumeration.FirstOrDefault(aBlock: not nullable PredicateBlock): nullable id;
begin
  for each i in self do
  begin
    if aBlock(i) then
    begin
      exit i;
    end;
  end;
  exit nil;
end;

extension method Foundation.INSFastEnumeration.Any(): Boolean;
begin
  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObject: id;
  result := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(var lState) objects(var lObject) count(1) ≥ 1; //cast is workaround, remove;
end;

extension method Foundation.INSFastEnumeration.Count: NSInteger;
begin
  if self is NSArray then exit (self as NSArray).count;
  if self.respondsToSelector(selector(count)) then exit (self as id).count;

  var lState: NSFastEnumerationState := default(NSFastEnumerationState);
  var lObjects: array[0..LOOP_SIZE-1] of id;

  result := 0;
  loop begin
    var lGot := Foundation.INSFastEnumeration(self).countByEnumeratingWithState(@lState) objects(lObjects) count(LOOP_SIZE); //cast is workaround, remove;
    if lGot = 0 then break;
    result := result+lGot;
  end;
end;

extension method Foundation.INSFastEnumeration.Max: id;
begin
  for each i in self do
    if not assigned(result) or (result.compare(i) = NSComparisonResult.OrderedAscending) then
      result := i;
end;

extension method Foundation.INSFastEnumeration.Max(aBlock: not nullable IDBlock): id;
begin
  for each i in self do begin
    var i2 := aBlock(i);
    if not assigned(result) or (result.compare(i2) = NSComparisonResult.OrderedAscending) then
      result := i2;
  end;
end;

extension method Foundation.INSFastEnumeration.Min: id;
begin
  for each i in self do
    if not assigned(result) or (result.compare(i) = NSComparisonResult.OrderedDescending) then
      result := i;
end;

extension method Foundation.INSFastEnumeration.Min(aBlock: not nullable IDBlock): id;
begin
  for each i in self do begin
    var i2 := aBlock(i);
    if not assigned(result) or (result.compare(i2) = NSComparisonResult.OrderedDescending) then
      result := i2;
  end;
end;

//
// Generic versions
//


extension method RemObjects.Elements.System.INSFastEnumeration<T>.Where(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Where(PredicateBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Any(aBlock: not nullable block(aItem: not nullable T): Boolean): Boolean;
begin
  exit Foundation.INSFastEnumeration(self).Any(PredicateBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Take(aCount: NSInteger): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Take(aCount);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Skip(aCount: NSInteger): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Skip(aCount);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.TakeWhile(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).TakeWhile(PredicateBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.SkipWhile(aBlock: not nullable block(aItem: not nullable T): Boolean): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).SkipWhile(PredicateBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.OrderBy(aBlock: not nullable block(aItem: not nullable T): id): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).OrderBy(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.OrderByDescending(aBlock: not nullable block(aItem: not nullable T): id): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).OrderByDescending(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.GroupBy<T,K>(aBlock: not nullable block(aItem: not nullable T): K): not nullable RemObjects.Elements.System.INSFastEnumeration<IGrouping<K,T>>;
begin
  exit Foundation.INSFastEnumeration(self).GroupBy(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Select<T, R>(aBlock: not nullable block(aItem: not nullable T): R): not nullable RemObjects.Elements.System.INSFastEnumeration<R>;
begin
  exit Foundation.INSFastEnumeration(self).Select(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.OfType<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>;
begin
  exit Foundation.INSFastEnumeration(self).OfType<R>();
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Cast<R>(): not nullable RemObjects.Elements.System.INSFastEnumeration<R>;
begin
  exit Foundation.INSFastEnumeration(self).Cast<R>();
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Concat(aSecond: not nullable RemObjects.Elements.System.INSFastEnumeration<T>): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Concat(Foundation.INSFastEnumeration(aSecond));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Reverse: not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Reverse;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Distinct(aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Distinct(aComparator);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Intersect(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Intersect(aSecond, aComparator);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Except(aSecond: not nullable Foundation.INSFastEnumeration; aComparator: NSComparator := nil): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit Foundation.INSFastEnumeration(self).Except(aSecond, aComparator);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Contains(aItem: T): Boolean;
begin
  exit Foundation.INSFastEnumeration(self).Contains(aItem);
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.FirstOrDefault: {nullable} T;
begin
  exit Foundation.INSFastEnumeration(self).FirstOrDefault;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.FirstOrDefault(aBlock: not nullable block(aItem: not nullable T): Boolean): {nullable} T;
begin
  exit Foundation.INSFastEnumeration(self).FirstOrDefault(PredicateBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Any(): Boolean;
begin
  exit Foundation.INSFastEnumeration(self).Any;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Count: NSInteger;
begin
  exit Foundation.INSFastEnumeration(self).Count;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Max: T;
begin
  result := Foundation.INSFastEnumeration(self).Max;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Max<T,R>(aBlock: not nullable block(aItem: not nullable T): R): R;
begin
  result := Foundation.INSFastEnumeration(self).Max(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Min: T;
begin
  result := Foundation.INSFastEnumeration(self).Min;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.Min<T,R>(aBlock: not nullable block(aItem: not nullable T): R): R;
begin
  result := Foundation.INSFastEnumeration(self).Min(IDBlock(aBlock));
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.array: not nullable NSArray<T>;
begin
  exit Foundation.INSFastEnumeration(self).array() as NSArray<T>;
end;

extension method RemObjects.Elements.System.INSFastEnumeration<T>.dictionary(aKeyBlock: block(aItem: id): id; aValueBlock: block(aItem: id): id): not nullable NSDictionary;
begin
  exit Foundation.INSFastEnumeration(self).dictionary(IDBlock(aKeyBlock), IDBlock(aValueBlock));
end;

//76496: Toffee: internal error and cant match complex generic extension method
extension method RemObjects.Elements.System.INSFastEnumeration<T>.dictionary<T,K,V>(aKeyBlock: block(aItem: T): K; aValueBlock: block(aItem: T): V): not nullable NSDictionary<K, V>;
begin
  exit Foundation.INSFastEnumeration(self).dictionary(IDBlock(aKeyBlock), IDBlock(aValueBlock));
end;

class method __Toffee_Linq_Helpers.ForHelper<T>(aStart: Integer; aEnd: Integer; aStep: Integer; aBackward: Boolean; aMethod: ForSelector<T>): not nullable RemObjects.Elements.System.INSFastEnumeration<T>;
begin
  exit IntForHelper(aStart, aEnd, aStep, aBackward, aMethod);
end;

class method __Toffee_Linq_Helpers.IntForHelper(aStart: Integer; aEnd: Integer; aStep: Integer; aBackward: Boolean; aMethod: ForSelector<id>): not nullable INSFastEnumeration;
begin
  if aBackward then
    for i: Integer := aStart downto aEnd step aStep do
      yield aMethod(i)
  else
    for i: Integer := aStart to aEnd step aStep do
      yield aMethod(i)
end;

end.