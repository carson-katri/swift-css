import XCTest
@testable import CSS

final class CSSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(CSS().text, "Hello, World!")
        XCTAssertEqual(
            Stylesheet {
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
                Media(.prefersColorScheme(.dark)) {
                    body {
                        background(.black)
                    }
                    html {
                        background(.black)
                    }
                }
            }.string().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: ""),
            "h1{color:black;}h4{color:red;}p{color:blue;border:5pxdashedblue;}@media(prefers-color-scheme:dark){body{background-color:black;}html{background-color:black;}}"
        )
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
