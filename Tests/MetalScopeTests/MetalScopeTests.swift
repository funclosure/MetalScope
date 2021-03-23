import XCTest
@testable import MetalScope

final class MetalScopeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MetalScope().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
