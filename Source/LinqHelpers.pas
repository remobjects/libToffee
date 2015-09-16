namespace RemObjects.Elements.Linq;

interface

uses
  Foundation;

type
  IOrderedFastEnumeration = interface(INSFastEnumeration)
    method sortDescriptors: sequence of NSSortDescriptor;
    method ThenOrderBy(aBlock: block(aItem: id): id): INSFastEnumeration;
    method ThenOrderByDescending(aBlock: block(aItem: id): id): INSFastEnumeration;
  end;

  OrderedEnumerable = assembly class(NSObject, INSFastEnumeration, IOrderedFastEnumeration)
  private
    fComparator: NSComparator;
    fDescriptor: NSSortDescriptor;
    fSorted: NSArray;
    fSequence: sequence of id;
    
    { INSFastEnumeration }
    method countByEnumeratingWithState(state: ^NSFastEnumerationState) objects(buffer: ^id) count(len: NSUInteger): NSUInteger;

    method sortDescriptors: sequence of NSSortDescriptor;
    method ThenOrderBy(aBlock: block(aItem: id): id): INSFastEnumeration; iterator;
  public
    method initWithSequence(aSequence: sequence of id) comparator(aComparator: NSComparator): instancetype;
  end;

implementation

method OrderedEnumerable.initWithSequence(aSequence: sequence of id) comparator(aComparator: NSComparator): instancetype;
begin
  self := inherited init();
  if assigned(self) then begin
    fSequence := aSequence;
    fComparator := aComparator;
    fDescriptor := new NSSortDescriptor withKey('self') ascending(true) comparator(fComparator);
  end;
  result := self;
end;

method OrderedEnumerable.sortDescriptors: sequence of NSSortDescriptor;
begin
  result := NSArray.arrayWithObject(fDescriptor);
  if fSequence is IOrderedFastEnumeration then
      result := result.Concat(IOrderedFastEnumeration(fSequence).sortDescriptors);
end;

method OrderedEnumerable.ThenOrderBy(aBlock: block(aItem: id): id): INSFastEnumeration; 
begin
  var lLocalComparator: NSComparator := (a,b) -> aBlock(b).compare(aBlock(a));
  var lLocalDescriptor := new NSSortDescriptor withKey('self') ascending(true) comparator(lLocalComparator);
  
  var lAllDescriptors := NSArray.arrayWithObject(lLocalDescriptor).Concat(sortDescriptors()); // use + operator

  var lOrdered := fSequence.array().sortedArrayUsingDescriptors(lAllDescriptors.array());
  for each i in lOrdered do
    yield i;
end;

{ INSFastEnumeration }
method OrderedEnumerable.countByEnumeratingWithState(state: ^NSFastEnumerationState) objects(buffer: ^id) count(len: NSUInteger): NSUInteger;
begin
  if not assigned(fSorted) then fSorted := fSequence.array().sortedArrayUsingComparator(fComparator);
  result := fSorted.countByEnumeratingWithState(state) objects(buffer) count(len);
end;

end.
