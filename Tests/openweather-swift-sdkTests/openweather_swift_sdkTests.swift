import XCTest
@testable import openweather_swift_sdk

final class openweather_swift_sdkTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(openweather_swift_sdk().text, "Hello, World!")
    }
}
