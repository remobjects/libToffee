namespace RemObjects.Elements.System;

interface

uses
  Foundation;

type
  NSDictionaryEnumerateBlock = public block(key: id; obj: id; stop: ^Boolean);
  NSDictionaryTestBlock = public block(key: id; obj: id; stop: ^Boolean): Boolean;

  NSDictionary<TKey, TValue> = public class mapped to Foundation.NSDictionary
    where TKey is class, TValue is class;
  public
    { Class Constructors }
    class method dictionary: id; mapped to dictionary;
    class method dictionaryWithContentsOfFile(path: not nullable NSString): id; mapped to dictionaryWithContentsOfFile(path);
    class method dictionaryWithContentsOfURL(aURL: not nullable NSURL): id; mapped to dictionaryWithContentsOfURL(aURL);
    class method dictionaryWithDictionary(otherDictionary: not nullable NSDictionary<TKey, TValue>): id; mapped to dictionaryWithDictionary(otherDictionary);
    class method dictionaryWithObject(anObject: not nullable TValue) forKey(aKey: not nullable TKey): id; mapped to dictionaryWithObject(anObject) forKey(aKey);
    class method dictionaryWithObjects(objects: not nullable NSArray<TValue>) forKeys(keys: not nullable NSArray<TKey>): id; mapped to dictionaryWithObjects(objects) forKeys(keys);
    class method dictionaryWithObjects(objects: ^TValue) forKeys(keys: ^TKey) count(count: NSUInteger): id; mapped to dictionaryWithObjects(^id(objects)) forKeys(^id(keys)) count(count);
    //class method dictionaryWithObjectsAndKeys(firstObject: not nullable id; params param1: array of id): id; mapped to dictionaryWithObjectsAndKeys(firstObject, param1);
    class method sharedKeySetForKeys(keys: not nullable NSArray<TKey>): id; mapped to sharedKeySetForKeys(keys);

    { Instance Methods }
    method allKeysForObject(anObject: not nullable id): NSArray<TKey>; mapped to allKeysForObject(anObject);
    method descriptionWithLocale(locale: id): NSString; mapped to descriptionWithLocale(locale);
    method descriptionWithLocale(locale: id) indent(level: Integer): NSString; mapped to descriptionWithLocale(locale) indent(level);
    method enumerateKeysAndObjectsUsingBlock(&block: not nullable block(key: TKey; obj: TValue; stop: ^Boolean)); mapped to enumerateKeysAndObjectsUsingBlock(NSDictionaryEnumerateBlock(&block));
    method enumerateKeysAndObjectsWithOptions(opts: NSEnumerationOptions) usingBlock(&block: not nullable block(key: TKey; obj: TValue; stop: ^Boolean)); mapped to enumerateKeysAndObjectsWithOptions(opts) usingBlock(NSDictionaryEnumerateBlock(&block));
    //method getObjects(objects: ^id) andKeys(keys: ^id); mapped to getObjects(objects) andKeys(keys);
    method isEqualToDictionary(otherDictionary: not nullable NSDictionary<TKey, TValue>): Boolean; mapped to isEqualToDictionary(otherDictionary);
    method keysOfEntriesPassingTest(predicate: not nullable block(key: TKey; obj: TValue; stop: ^Boolean): Boolean): NSSet; mapped to keysOfEntriesPassingTest(NSDictionaryTestBlock(predicate));
    method keysOfEntriesWithOptions(opts: NSEnumerationOptions) passingTest(predicate: not nullable block(key: TKey; obj: TValue; stop: ^Boolean): Boolean): NSSet; mapped to keysOfEntriesWithOptions(opts) passingTest(NSDictionaryTestBlock(predicate));
    method keysSortedByValueUsingComparator(cmptr: not nullable NSComparator): NSArray<TKey>; mapped to keysSortedByValueUsingComparator(cmptr);
    method keysSortedByValueUsingSelector(comparator: SEL): NSArray<TKey>; mapped to keysSortedByValueUsingSelector(comparator);
    method keysSortedByValueWithOptions(opts: NSSortOptions) usingComparator(cmptr: NSComparator): NSArray<TKey>; mapped to keysSortedByValueWithOptions(opts) usingComparator(cmptr);
    method objectForKey(aKey: not nullable TKey): TValue; mapped to objectForKey(aKey);
    method objectForKeyedSubscript(key: not nullable TKey): TValue; mapped to objectForKeyedSubscript(key);
    method objectsForKeys(keys:not nullable  NSArray<TKey>) notFoundMarker(anObject: id): NSArray<TValue>; mapped to objectsForKeys(keys) notFoundMarker(anObject);
    method writeToFile(path: not nullable String) atomically(flag: Boolean): Boolean; mapped to writeToFile(path) atomically(flag);
    method writeToURL(aURL: not nullable NSURL) atomically(flag: Boolean): Boolean; mapped to writeToURL(aURL) atomically(flag);

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
  end;

implementation

end.