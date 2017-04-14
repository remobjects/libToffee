import Foundation

public class ToffeeErrorException : NSException {
	public let error: NSError

	public init(error: NSError) {
		super.init(name: "NSError Exception", reason: error.localizedDescription, userInfo: error.userInfo)
		self.error = error
	}
}

//
//
// CAUTION: Magic type name.
// The compiler will use __ElementsThrowException() when implementing do {} catch {} clauses for Swift
//
//

public func __ElementsCreateExceptionWithError(_ error: NSError) -> ToffeeErrorException {
	return ToffeeErrorException(error: error)
}

public func __ElementsWillThrowError(_ error: NSError) {
	// this space intentionally left blank
}