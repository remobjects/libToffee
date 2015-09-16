namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSSetEnumerateBlock = block(obj: id; stop: ^Boolean);
  NSSetTestBlock = block(obj: id; stop: ^Boolean): Boolean;

  NSSet<T> = public class(RemObjects.Elements.System.INSFastEnumeration<T>) mapped to Foundation.NSSet
    where T is class;
  public
    { Class Constructors }
    class method &set: id; mapped to &set;
    class method setWithArray(&array: NSArray<T>): id; mapped to setWithArray(&array);
    class method setWithObject(&object: T): id; mapped to setWithObject(&object);
    class method setWithObjects(firstObject: id; params param1: array of id); mapped to setWithObjects(firstObject, param1);
    class method setWithObjects(objects: ^T) count(cnt: NSUInteger): id; mapped to setWithObjects(^id(objects)) count(cnt);
    class method setWithSet(&set: NSSet<T>): id; mapped to setWithSet(&set);

    { Instance Methods }
    method addObserver(observer: NSObject) forKeyPath(keyPath: NSString) options(options: NSKeyValueObservingOptions) context(var context); mapped to addObserver(observer) forKeyPath(keyPath) options(options) context(@context);
    method containsObject(anObject: T): Boolean; mapped to containsObject(anObject);
    method descriptionWithLocale(locale: id): NSString; mapped to descriptionWithLocale(locale);
    method enumerateObjectsUsingBlock(&block: block(obj: T; stop: ^Boolean)); mapped to enumerateObjectsUsingBlock(NSSetEnumerateBlock(&block));
    method enumerateObjectsWithOptions(opts: NSEnumerationOptions) usingBlock(&block: block(obj: T; stop: ^Boolean)); mapped to enumerateObjectsWithOptions(opts) usingBlock(NSSetEnumerateBlock(&block));
    method filteredSetUsingPredicate(predicate: NSPredicate): NSSet<T>; mapped to filteredSetUsingPredicate(predicate);
    method intersectsSet(otherSet: NSSet<T>): Boolean; mapped to intersectsSet(otherSet);
    method isEqualToSet(otherSet: NSSet<T>): Boolean; mapped to isEqualToSet(otherSet);
    method isSubsetOfSet(otherSet: NSSet<T>): Boolean; mapped to isSubsetOfSet(otherSet);
    method makeObjectsPerformSelector(aSelector: SEL); mapped to makeObjectsPerformSelector(aSelector);
    method makeObjectsPerformSelector(aSelector: SEL) withObject(argument: id); mapped to makeObjectsPerformSelector(aSelector) withObject(argument);
    method member(&object: T): T; mapped to member(&object);
    method objectsPassingTest(predicate: block(obj: T; stop: ^Boolean): Boolean); mapped to objectsPassingTest(NSSetTestBlock(predicate));
    method objectsWithOptions(opts: NSEnumerationOptions) passingTest(predicate: block(obj: T; stop: ^Boolean): Boolean); mapped to objectsWithOptions(opts) passingTest(NSSetTestBlock(predicate));
    method setByAddingObject(anObject: T): NSSet<T>; mapped to setByAddingObject(anObject);
    method setByAddingObjectsFromArray(other: NSArray<T>): NSSet<T>; mapped to setByAddingObjectsFromArray(other);
    method setByAddingObjectsFromSet(other: NSSet<T>): NSSet<T>; mapped to setByAddingObjectsFromSet(other);
    method sortedArrayUsingDescriptors(sortDescriptors: NSArray): NSArray<T>; mapped to sortedArrayUsingDescriptors(sortDescriptors);

    { Instance Properties }
    property allObjects: NSArray<T> read mapped.allObjects;
    property anyObject: T read mapped.anyObject;
    property count: NSUInteger read mapped.count;
    property objectEnumerator: NSEnumerator read mapped.objectEnumerator;
  end;

implementation

end.