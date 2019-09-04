import XCTest
@testable import CSS

final class CSSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(CSS().text, "Hello, World!")
        print(Stylesheet {
            Select(.h1) {
                color(.black)
            }
            heading(4) {
                color(.red)
            }
            p {
                color(.blue)
                border(.blue, 5, .dashed)
            }
        }.string())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
