namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSMutableArray<T> = public class(RemObjects.Elements.System.NSArray<T>, RemObjects.Elements.System.INSFastEnumeration<T>) mapped to Foundation.NSMutableArray
    where T is class;
  public
    { Class Constructors }
    class method &array: id; mapped to &array;
    class method arrayWithArray(anArray: not nullable NSArray<T>): id; mapped to arrayWithArray(anArray);
    class method arrayWithContentsOfFile(aPath: not nullable NSString): id; mapped to arrayWithContentsOfFile(aPath);
    class method arrayWithContentsOfURL(aURL: not nullable NSURL): id; mapped to arrayWithContentsOfURL(aURL);
    class method arrayWithObject(anObject: not nullable T): id; mapped to arrayWithObject(anObject);
    class method arrayWithObjects(objects: ^T) count(count: NSUInteger): id; mapped to arrayWithObjects(^id(objects)) count(count);
    class method arrayWithObjects(firstObject: not nullable id; params param1: array of id): id; mapped to arrayWithObjects(firstObject, param1);
    (*
    { Instance Methods }
    method addObserver(anObserver: Object) toObjectsAtIndexes(indexes: NSIndexSet) forKeyPath(keyPath: NSString) options(options: NSKeyValueObservingOptions) context(context: ^Void); mapped to addObserver(anObserver) toObjectsAtIndexes(indexes) forKeyPath(keyPath) options(options) context(context);
    method arrayByAddingObject(anObject: T): NSArray<T>; mapped to arrayByAddingObject(anObject);
    method arrayByAddingObjectsFromArray(otherArray: NSArray<T>): NSArray<T>; mapped to arrayByAddingObjectsFromArray(otherArray);
    method componentsJoinedByString(separator: NSString): NSString; mapped to componentsJoinedByString(separator);
    method containsObject(anObject: T): Boolean; mapped to containsObject(anObject);
    method descriptionWithLocale(locale: id): NSString; mapped to descriptionWithLocale(locale);
    method descriptionWithLocale(locale: id) indent(level: NSUInteger): NSString; mapped to descriptionWithLocale(locale) indent(level);
    method enumerateObjectsAtIndexes(indexSet: NSIndexSet) options(options: NSEnumerationOptions) usingBlock(&block: block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsAtIndexes(indexSet) options(options) usingBlock(NSArrayEnumerateBlock(&block));
    method enumerateObjectsUsingBlock(&block: block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsUsingBlock(NSArrayEnumerateBlock(&block));
    method enumerateObjectsWithOptions(opts: NSEnumerationOptions) usingBlock(&block: block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsWithOptions(opts) usingBlock(NSArrayEnumerateBlock(&block));
    method filteredArrayUsingPredicate(predicate: NSPredicate): NSArray<T>; mapped to filteredArrayUsingPredicate(predicate);
    method firstObjectCommonWithArray(otherArray: NSArray<T>): T; mapped to firstObjectCommonWithArray(otherArray);
    //method getObjects(aBuffer: ^id) range(aRange: NSRange); mapped to getObjects(aBuffer) range(aRange);  
    
    method indexesOfObjectsAtIndexes(indexSet: NSIndexSet) options(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsAtIndexes(indexSet) options(opts) passingTest(NSArrayTestBlock(predicate)); 
    method indexesOfObjectsPassingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsPassingTest(NSArrayTestBlock(predicate));
    method indexesOfObjectsWithOptions(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsWithOptions(opts) passingTest(NSArrayTestBlock(predicate));

    method indexOfObject(anObject: T): NSUInteger; mapped to indexOfObject(anObject);
    method indexOfObject(anObject: T) inRange(range: NSRange): NSUInteger; mapped to indexOfObject(anObject) inRange(range);    
    method indexOfObject(obj: T) inSortedRange(r: NSRange) options(opts: NSBinarySearchingOptions) usingComparator(cmp: NSComparator): NSUInteger; mapped to indexOfObject(obj) inSortedRange(r) options(opts) usingComparator(cmp);
    method indexOfObjectAtIndexes(indexSet: NSIndexSet) options(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectAtIndexes(indexSet) options(opts) passingTest(NSArrayTestBlock(predicate));
    method indexOfObjectIdenticalTo(anObject: T): NSUInteger; mapped to indexOfObjectIdenticalTo(anObject);
    method indexOfObjectIdenticalTo(anObject: T) inRange(range: NSRange): NSUInteger; mapped to indexOfObjectIdenticalTo(anObject) inRange(range);
    method indexOfObjectPassingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectPassingTest(NSArrayTestBlock(predicate));
    method indexOfObjectWithOptions(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectWithOptions(opts) passingTest(NSArrayTestBlock(predicate));
    method isEqualToArray(otherArray: NSArray<T>): Boolean; mapped to isEqualToArray(otherArray);
    
    method makeObjectsPerformSelector(aSelector: SEL); mapped to makeObjectsPerformSelector(aSelector);
    method makeObjectsPerformSelector(aSelector: SEL) withObject(anObject: id); mapped to makeObjectsPerformSelector(aSelector) withObject(anObject);
    method objectAtIndex(&index: NSUInteger): T; mapped to objectAtIndex(&index);
    method objectAtIndexedSubscript(&index: NSUInteger): T; mapped to objectAtIndexedSubscript(&index);
    
    method objectsAtIndexes(indexes: NSIndexSet): NSArray<T>; mapped to objectsAtIndexes(indexes);
    method pathsMatchingExtensions(filterTypes: NSArray<NSString>): NSArray; mapped to pathsMatchingExtensions(filterTypes);
    method removeObserver(anObserver: Object) fromObjectsAtIndexes(indexes: NSIndexSet) forKeyPath(keyPath: String); mapped to removeObserver(anObserver) fromObjectsAtIndexes(indexes) forKeyPath(keyPath);
    method removeObserver(anObserver: Object) fromObjectsAtIndexes(indexes: NSIndexSet) forKeyPath(keyPath: String) context(var context); mapped to removeObserver(anObserver) fromObjectsAtIndexes(indexes) forKeyPath(keyPath) context(@context);
    method sortedArrayHint: NSData; mapped to sortedArrayHint;
    method sortedArrayUsingComparator(cmp: NSComparator): NSArray<T>; mapped to sortedArrayUsingComparator(cmp);
    method sortedArrayUsingDescriptors(sortDescriptors: NSArray<NSSortDescriptor>): NSArray<T>; mapped to sortedArrayUsingDescriptors(sortDescriptors);    
    
    //Check with Carlo
    //- (NSArray * )sortedArrayUsingFunction:(NSInteger (* )(id, id, void * ))comparator context:(void * )context
    //- (NSArray * )sortedArrayUsingFunction:(NSInteger (* )(id, id, void * ))comparator context:(void * )context hint:(NSData * )hint
    method sortedArrayUsingFunction(comparator: method(obj1: T; obj2: T; context: ^Void): NSInteger) context(context: ^Void): NSArray<T>; mapped to sortedArrayUsingFunction(NSArraySortMethod(comparator)) context(context);
    method sortedArrayUsingFunction(comparator: method(obj1: T; obj2: T; context: ^Void): NSInteger) context(context: ^Void) hint(hint: NSData): NSArray<T>; mapped to sortedArrayUsingFunction(NSArraySortMethod(comparator)) context(context) hint(hint);

    method sortedArrayUsingSelector(comparator: SEL): NSArray<T>; mapped to sortedArrayUsingSelector(comparator);
    method sortedArrayWithOptions(opts: NSSortOptions) usingComparator(cmptr: NSComparator): NSArray<T>; mapped to sortedArrayWithOptions(opts) usingComparator(cmptr);
    method subarrayWithRange(range: NSRange): NSArray<T>; mapped to subarrayWithRange(range);
    method writeToFile(path: NSString) atomically(flag: Boolean): Boolean; mapped to writeToFile(path) atomically(flag);
    method writeToURL(aURL: NSURL) atomically(flag: Boolean): Boolean; mapped to writeToURL(aURL) atomically(flag);

    { Instance Properties }
    property count: NSUInteger read mapped.count;
    property lastObject: T read mapped.lastObject;
    property objectEnumerator: NSEnumerator read mapped.objectEnumerator;
    property reverseObjectEnumerator: NSEnumerator read mapped.reverseObjectEnumerator;
    *)
    { NSMutableArray }
    class method arrayWithCapacity(numItems: NSUInteger): id; mapped to arrayWithCapacity(numItems);
    
    method addObject(anObject: not nullable T); mapped to addObject(anObject);
    method addObjectsFromArray(otherArray: not nullable NSArray<T>); mapped to addObjectsFromArray(otherArray);
    method exchangeObjectAtIndex(idx1: NSUInteger) withObjectAtIndex(indx2: NSUInteger); mapped to exchangeObjectAtIndex(idx1) withObjectAtIndex(indx2);
    method filterUsingPredicate(predicate: not nullable NSPredicate); mapped to filterUsingPredicate(predicate);
    method insertObject(anObject: T) atIndex(&index: NSUInteger); mapped to insertObject(anObject) atIndex(&index);
    method insertObjects(objects: not nullable NSArray<T>) atIndexes(indexes: not nullable NSIndexSet); mapped to insertObjects(objects) atIndexes(indexes);
    method removeAllObjects; mapped to removeAllObjects;
    method removeLastObject; mapped to removeLastObject;
    method removeObject(anObject: not nullable T); mapped to removeObject(anObject);
    method removeObject(anObject: not nullable T) inRange(range: NSRange); mapped to removeObject(anObject) inRange(range);
    method removeObjectAtIndex(&index: NSUInteger); mapped to removeObjectAtIndex(&index);
    method removeObjectIdenticalTo(anObject: not nullable T); mapped to removeObjectIdenticalTo(anObject);
    method removeObjectIdenticalTo(anObject: not nullable T) inRange(range: NSRange); mapped to removeObjectIdenticalTo(anObject) inRange(range);
    method removeObjectsAtIndexes(indexes: NSIndexSet); mapped to removeObjectsAtIndexes(indexes);
    method removeObjectsInArray(otherArray: not nullable NSArray<T>); mapped to removeObjectsInArray(otherArray);
    method removeObjectsInRange(range: NSRange); mapped to removeObjectsInRange(range);
    method replaceObjectAtIndex(&index: NSUInteger) withObject(anObject: T); mapped to replaceObjectAtIndex(&index) withObject(anObject); 
    method replaceObjectsAtIndexes(indexes: not nullable NSIndexSet) withObjects(objects: not nullable NSArray<T>); mapped to replaceObjectsAtIndexes(indexes) withObjects(objects); 
    method replaceObjectsInRange(range: NSRange) withObjectsFromArray(otherArray: not nullable NSArray<T>); mapped to replaceObjectsInRange(range) withObjectsFromArray(otherArray);
    method replaceObjectsInRange(aRange: NSRange) withObjectsFromArray(otherArray: not nullable NSArray<T>) range(otherRange: NSRange); mapped to replaceObjectsInRange(aRange) withObjectsFromArray(otherArray) range(otherRange);
    method setArray(otherArray: not nullable NSArray<T>); mapped to setArray(otherArray);
    method setObject(anObject: not nullable T) atIndexedSubscript(&index: NSUInteger); mapped to setObject(anObject) atIndexedSubscript(&index);
    method sortUsingComparator(cmptr: not nullable NSComparator); mapped to sortUsingComparator(cmptr);
    method sortUsingDescriptors(sortDescriptors: not nullable NSArray<NSSortDescriptor>); mapped to sortUsingDescriptors(sortDescriptors);
    method sortUsingFunction(comparator: not nullable method(obj1: T; obj2: T; context: ^Void): NSInteger) context(context: ^Void); mapped to sortUsingFunction(NSArraySortMethod(comparator)) context(context);
    method sortUsingSelector(comparator: SEL); mapped to sortUsingSelector(comparator);
    method sortWithOptions(opts: NSSortOptions) usingComparator(cmptr: not nullable NSComparator); mapped to sortWithOptions(opts) usingComparator(cmptr);
  end;

implementation

end.