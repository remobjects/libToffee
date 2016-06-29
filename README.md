# libToffee

`libToffee` is a small library that can be optionally used in Elements projects for the Cocoa platform compiled with the [RemObjects Elements](http://elementscompiler.com) compiler. It provides some of the core runtime types that expand upon what's provided by the platform, as well as helper classes and functions.

This includes generic versions of `NSArray` and `NSDictionary`, a core LINQ implementation, support for boxing Char types, and and more.

`libToffee` ships precompiled with the [Elements](http://elementscompiler.com) compiler, and new projects created with one of the Cocoa project templates will automatically have a reference to the library. Should you need to add a reference manually, you can do so via the [Add References](http://docs.elementscompiler.com/Projects/References) dialog in Fire or Visual Studio, where the `libToffee.fx` library should show automatically.

The code for this library is open source and available under a liberal license. We appreciate contributions.

## See Also

* [RemObjects Elements Homepage](http://www.elementscompiler.com/)
* [RemObjects Elements Docs](http://docs.elementscompiler.com/)
* [libToffee.fx](http://docs.elementscompiler.com/Platforms/Cocoa/Frameworks/libToffee/) on docs.elementscompiler.com
