namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSMutableDictionary<TKey, TValue> = public class(RemObjects.Elements.System.NSDictionary<TKey, TValue>) mapped to Foundation.NSMutableDictionary
    where TKey is class, TKey is INSCopying, TValue is class;
  public
    { Class Constructors }
    class method dictionary: id; mapped to dictionary;
    class method dictionaryWithContentsOfFile(path: not nullable NSString): id; mapped to dictionaryWithContentsOfFile(path);
    class method dictionaryWithContentsOfURL(aURL: not nullable NSURL): id; mapped to dictionaryWithContentsOfURL(aURL);
    class method dictionaryWithDictionary(otherDictionary: not nullable NSDictionary<TKey, TValue>): id; mapped to dictionaryWithDictionary(otherDictionary);
    class method dictionaryWithObject(anObject: not nullable TValue) forKey(aKey: not nullable TKey): id; mapped to dictionaryWithObject(anObject) forKey(aKey);
    class method dictionaryWithObjects(objects: not nullable NSArray<TValue>) forKeys(keys: not nullable NSArray<TKey>): id; mapped to dictionaryWithObjects(objects) forKeys(keys);
    class method dictionaryWithObjects(objects: ^TValue) forKeys(keys: ^TKey) count(count: NSUInteger): id; mapped to dictionaryWithObjects(^id(objects)) forKeys(^id(keys)) count(count);
    class method dictionaryWithObjectsAndKeys(firstObject: not nullable id; params param1: array of id): id; mapped to dictionaryWithObjectsAndKeys(firstObject, param1);
    class method sharedKeySetForKeys(keys: not nullable NSArray<TKey>): id; mapped to sharedKeySetForKeys(keys);
    (*
    { Instance Methods }   
    method allKeysForObject(anObject: id): NSArray<TKey>; mapped to allKeysForObject(anObject);    
    method descriptionWithLocale(locale: id): NSString; mapped to descriptionWithLocale(locale);
    method descriptionWithLocale(locale: id) indent(level: Integer): NSString; mapped to descriptionWithLocale(locale) indent(level);
    method enumerateKeysAndObjectsUsingBlock(&block: block(key: TKey; obj: TValue; stop: ^Boolean)); mapped to enumerateKeysAndObjectsUsingBlock(NSDictionaryEnumerateBlock(&block));
    method enumerateKeysAndObjectsWithOptions(opts: NSEnumerationOptions) usingBlock(&block: block(key: TKey; obj: TValue; stop: ^Boolean)); mapped to enumerateKeysAndObjectsWithOptions(opts) usingBlock(NSDictionaryEnumerateBlock(&block));
    //method getObjects(objects: ^id) andKeys(keys: ^id); mapped to getObjects(objects) andKeys(keys);
    method isEqualToDictionary(otherDictionary: NSDictionary<TKey, TValue>): Boolean; mapped to isEqualToDictionary(otherDictionary);
    method keysOfEntriesPassingTest(predicate: block(key: TKey; obj: TValue; stop: ^Boolean): Boolean): NSSet; mapped to keysOfEntriesPassingTest(NSDictionaryTestBlock(predicate));
    method keysOfEntriesWithOptions(opts: NSEnumerationOptions) passingTest(predicate: block(key: TKey; obj: TValue; stop: ^Boolean): Boolean): NSSet; mapped to keysOfEntriesWithOptions(opts) passingTest(NSDictionaryTestBlock(predicate));
    method keysSortedByValueUsingComparator(cmptr: NSComparator): NSArray<TKey>; mapped to keysSortedByValueUsingComparator(cmptr);
    method keysSortedByValueUsingSelector(comparator: SEL): NSArray<TKey>; mapped to keysSortedByValueUsingSelector(comparator);
    method keysSortedByValueWithOptions(opts: NSSortOptions) usingComparator(cmptr: NSComparator): NSArray<TKey>; mapped to keysSortedByValueWithOptions(opts) usingComparator(cmptr);
    method objectForKey(aKey: TKey): TValue; mapped to objectForKey(aKey);
    method objectForKeyedSubscript(key: TKey): TValue; mapped to objectForKeyedSubscript(key);
    method objectsForKeys(keys: NSArray<TKey>) notFoundMarker(anObject: id): NSArray<TValue>; mapped to objectsForKeys(keys) notFoundMarker(anObject);
    method writeToFile(path: String) atomically(flag: Boolean): Boolean; mapped to writeToFile(path) atomically(flag);
    method writeToURL(aURL: NSURL) atomically(flag: Boolean): Boolean; mapped to writeToURL(aURL) atomically(flag);

    { Instance Properties }
    property count: NSUInteger read mapped.count;
    property allKeys: NSArray<TKey> read mapped.allKeys;
    property allValues: NSArray<TValue> read mapped.allValues;
    property descriptionInStringsFileFormat: NSString read mapped.descriptionInStringsFileFormat;     
    property fileCreationDate: NSDate read mapped.fileCreationDate;
    property fileExtensionHidden: Boolean read mapped.fileExtensionHidden;
    property fileGroupOwnerAccountID: NSNumber read mapped.fileGroupOwnerAccountID;
    property fileGroupOwnerAccountName: NSString read mapped.fileGroupOwnerAccountName;
    property fileHFSCreatorCode: OSType read mapped.fileHFSCreatorCode;
    property fileHFSTypeCode: OSType read mapped.fileHFSTypeCode;
    property fileIsAppendOnly: Boolean read mapped.fileIsAppendOnly;
    property fileIsImmutable: Boolean read mapped.fileIsImmutable;
    property fileModificationDate: NSDate read mapped.fileModificationDate;
    property fileOwnerAccountID: NSNumber read mapped.fileOwnerAccountID;
    property fileOwnerAccountName: NSString read mapped.fileOwnerAccountName;
    property filePosixPermissions: NSUInteger read mapped.filePosixPermissions;
    property fileSize: Int64 read mapped.fileSize;
    property fileSystemFileNumber: NSUInteger read mapped.fileSystemFileNumber;
    property fileSystemNumber: NSInteger read mapped.fileSystemNumber;
    property fileType: NSString read mapped.fileType;    
    property keyEnumerator: NSEnumerator read mapped.keyEnumerator;
    property objectEnumerator: NSEnumerator read mapped.objectEnumerator;
    *)
    { NSMutableDictionary }
    class method dictionaryWithCapacity(numItems: NSUInteger): id; mapped to dictionaryWithCapacity(numItems);
    class method dictionaryWithSharedKeySet(keyset: id): id; mapped to dictionaryWithSharedKeySet(keyset);

    method addEntriesFromDictionary(otherDictionary: not nullable NSDictionary<TKey,TValue>); mapped to addEntriesFromDictionary(otherDictionary);
    method removeAllObjects; mapped to removeAllObjects;
    method removeObjectForKey(aKey: not nullable TKey); mapped to removeObjectForKey(aKey);
    method removeObjectsForKeys(keyArray: not nullable NSArray<TKey>); mapped to removeObjectsForKeys(keyArray);
    method setDictionary(otherDictionary: not nullable NSDictionary<TKey,TValue>); mapped to setDictionary(otherDictionary);
    method setObject(anObject: TValue) forKey(aKey: not nullable TKey); mapped to setObject(anObject) forKey(INSCopying(aKey));
    method setObject(anObject: TValue) forKeyedSubscript(aKey: not nullable TKey); mapped to setObject(anObject) forKeyedSubscript(INSCopying(aKey));
  end;

implementation

end.