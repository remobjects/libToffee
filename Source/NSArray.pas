namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSArrayEnumerateBlock = public block (obj: id; idx: NSUInteger; stop: ^Boolean);
  NSArrayTestBlock = public block (obj: id; idx: NSUInteger; stop: ^Boolean): Boolean;
  NSArraySortMethod = public method(obj1: id; obj: id; context: ^Void): NSInteger;

  NSArray<T> = public class(INSFastEnumeration<T>) mapped to Foundation.NSArray
    where T is class;
  public
    { Class Constructors }
    class method &array: id; mapped to &array;
    class method arrayWithArray(anArray: not nullable NSArray<T>): id; mapped to arrayWithArray(anArray);
    class method arrayWithContentsOfFile(aPath: not nullable NSString): id; mapped to arrayWithContentsOfFile(aPath);
    class method arrayWithContentsOfURL(aURL: not nullable NSURL): id; mapped to arrayWithContentsOfURL(aURL);
    class method arrayWithObject(anObject: not nullable T): id; mapped to arrayWithObject(anObject);
    class method arrayWithObjects(objects: ^T) count(count: NSUInteger): id; mapped to arrayWithObjects(^id(objects)) count(count);
    class method arrayWithObjects(params objects: array of id): id; mapped to arrayWithObjects(^id(@objects[0])) count (length(objects));

    { Instance Methods }
    method addObserver(anObserver: Object) toObjectsAtIndexes(indexes: NSIndexSet) forKeyPath(keyPath: NSString) options(options: NSKeyValueObservingOptions) context(context: ^Void); mapped to addObserver(anObserver) toObjectsAtIndexes(indexes) forKeyPath(keyPath) options(options) context(context);
    method arrayByAddingObject(anObject: not nullable T): NSArray<T>; mapped to arrayByAddingObject(anObject);
    method arrayByAddingObjectsFromArray(otherArray: not nullable NSArray<T>): NSArray<T>; mapped to arrayByAddingObjectsFromArray(otherArray);
    method componentsJoinedByString(separator: not nullable NSString): NSString; mapped to componentsJoinedByString(separator);
    method containsObject(anObject: not nullable T): Boolean; mapped to containsObject(anObject);
    method descriptionWithLocale(locale: id): NSString; mapped to descriptionWithLocale(locale);
    method descriptionWithLocale(locale: id) indent(level: NSUInteger): NSString; mapped to descriptionWithLocale(locale) indent(level);
    method enumerateObjectsAtIndexes(indexSet: not nullable NSIndexSet) options(options: NSEnumerationOptions) usingBlock(&block: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsAtIndexes(indexSet) options(options) usingBlock(NSArrayEnumerateBlock(&block));
    method enumerateObjectsUsingBlock(&block: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsUsingBlock(NSArrayEnumerateBlock(&block));
    method enumerateObjectsWithOptions(opts: NSEnumerationOptions) usingBlock(&block: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean)); mapped to enumerateObjectsWithOptions(opts) usingBlock(NSArrayEnumerateBlock(&block));
    method filteredArrayUsingPredicate(predicate: not nullable NSPredicate): NSArray<T>; mapped to filteredArrayUsingPredicate(predicate);
    method firstObjectCommonWithArray(otherArray: not nullable NSArray<T>): T; mapped to firstObjectCommonWithArray(otherArray);
    //method getObjects(aBuffer: ^id) range(aRange: NSRange); mapped to getObjects(aBuffer) range(aRange);

    method indexesOfObjectsAtIndexes(indexSet: not nullable NSIndexSet) options(opts: NSEnumerationOptions) passingTest(predicate: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsAtIndexes(indexSet) options(opts) passingTest(NSArrayTestBlock(predicate));
    method indexesOfObjectsPassingTest(predicate: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsPassingTest(NSArrayTestBlock(predicate));
    method indexesOfObjectsWithOptions(opts: NSEnumerationOptions) passingTest(predicate: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSIndexSet; mapped to indexesOfObjectsWithOptions(opts) passingTest(NSArrayTestBlock(predicate));

    method indexOfObject(anObject: not nullable T): NSUInteger; mapped to indexOfObject(anObject);
    method indexOfObject(anObject: not nullable T) inRange(range: NSRange): NSUInteger; mapped to indexOfObject(anObject) inRange(range);
    method indexOfObject(obj: not nullable T) inSortedRange(r: NSRange) options(opts: NSBinarySearchingOptions) usingComparator(cmp: not nullable NSComparator): NSUInteger; mapped to indexOfObject(obj) inSortedRange(r) options(opts) usingComparator(cmp);
    method indexOfObjectAtIndexes(indexSet: not nullable NSIndexSet) options(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectAtIndexes(indexSet) options(opts) passingTest(NSArrayTestBlock(predicate));
    method indexOfObjectIdenticalTo(anObject: not nullable T): NSUInteger; mapped to indexOfObjectIdenticalTo(anObject);
    method indexOfObjectIdenticalTo(anObject: not nullable T) inRange(range: NSRange): NSUInteger; mapped to indexOfObjectIdenticalTo(anObject) inRange(range);
    method indexOfObjectPassingTest(predicate: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectPassingTest(NSArrayTestBlock(predicate));
    method indexOfObjectWithOptions(opts: NSEnumerationOptions) passingTest(predicate: not nullable block(obj: T; idx: NSUInteger; stop: ^Boolean): Boolean): NSUInteger; mapped to indexOfObjectWithOptions(opts) passingTest(NSArrayTestBlock(predicate));
    method isEqualToArray(otherArray: not nullable NSArray<T>): Boolean; mapped to isEqualToArray(otherArray);

    method makeObjectsPerformSelector(aSelector: SEL); mapped to makeObjectsPerformSelector(aSelector);
    method makeObjectsPerformSelector(aSelector: SEL) withObject(anObject: id); mapped to makeObjectsPerformSelector(aSelector) withObject(anObject);
    method objectAtIndex(&index: NSUInteger): not nullable T; mapped to objectAtIndex(&index);
    method objectAtIndexedSubscript(&index: NSUInteger): not nullable T; mapped to objectAtIndexedSubscript(&index);

    method objectsAtIndexes(indexes: not nullable NSIndexSet): not nullable NSArray<T>; mapped to objectsAtIndexes(indexes);
    method pathsMatchingExtensions(filterTypes: not nullable NSArray<NSString>): NSArray; mapped to pathsMatchingExtensions(filterTypes);
    method removeObserver(anObserver: Object) fromObjectsAtIndexes(indexes: not nullable NSIndexSet) forKeyPath(keyPath: String); mapped to removeObserver(anObserver) fromObjectsAtIndexes(indexes) forKeyPath(keyPath);
    method removeObserver(anObserver: Object) fromObjectsAtIndexes(indexes: not nullable NSIndexSet) forKeyPath(keyPath: String) context(var context); mapped to removeObserver(anObserver) fromObjectsAtIndexes(indexes) forKeyPath(keyPath) context(@context);
    method sortedArrayHint: NSData; mapped to sortedArrayHint;
    method sortedArrayUsingComparator(cmp: not nullable NSComparator): not nullable NSArray<T>; mapped to sortedArrayUsingComparator(cmp);
    method sortedArrayUsingDescriptors(sortDescriptors: not nullable NSArray<NSSortDescriptor>): not nullable NSArray<T>; mapped to sortedArrayUsingDescriptors(sortDescriptors);

    //Check with Carlo
    //- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context
    //- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context hint:(NSData *)hint
    method sortedArrayUsingFunction(comparator: method(obj1: T; obj2: T; context: ^Void): NSInteger) context(context: ^Void): not nullable NSArray<T>; mapped to sortedArrayUsingFunction(NSArraySortMethod(comparator)) context(context);
    method sortedArrayUsingFunction(comparator: method(obj1: T; obj2: T; context: ^Void): NSInteger) context(context: ^Void) hint(hint: NSData): not nullable NSArray<T>; mapped to sortedArrayUsingFunction(NSArraySortMethod(comparator)) context(context) hint(hint);

    method sortedArrayUsingSelector(comparator: SEL): not nullable NSArray<T>; mapped to sortedArrayUsingSelector(comparator);
    method sortedArrayWithOptions(opts: NSSortOptions) usingComparator(cmptr: NSComparator): not nullable NSArray<T>; mapped to sortedArrayWithOptions(opts) usingComparator(cmptr);
    method subarrayWithRange(range: NSRange): not nullable NSArray<T>; mapped to subarrayWithRange(range);
    method writeToFile(path: not nullable NSString) atomically(flag: Boolean): Boolean; mapped to writeToFile(path) atomically(flag);
    method writeToURL(aURL: not nullable NSURL) atomically(flag: Boolean): Boolean; mapped to writeToURL(aURL) atomically(flag);

    { Instance Properties }
    property count: NSUInteger read mapped.count;
    property lastObject: not nullable T read mapped.lastObject;
    property objectEnumerator: not nullable NSEnumerator read mapped.objectEnumerator;
    property reverseObjectEnumerator: not nullable NSEnumerator read mapped.reverseObjectEnumerator;
  end;

implementation

end.