import XCTest
@testable import CSS

final class CSSTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expects =
        """
        h1 {
         color: black;
        }

        h4 {
         color: red;
        }

        p {
         color: blue;
        }
        @media (prefers-color-scheme: dark) {
          border: 5px dashed blue;
        }
        body div p {
         color: red;
        }
        body div {
         background-color: red;
        }


        @media (prefers-color-scheme: dark) {
          body {
         background-color: black;
        }

        html {
         background-color: black;
        }

        }
        """
        XCTAssertEqual(
            Stylesheet {
                Select(.h1) {
                    color(.black)
                }
                Heading(4) {
                    color(.red)
                }
                Paragraph {
                    color(.blue)
                    border(.blue, 5, .dashed)
                        .when(.colorScheme(.dark))
                }
                Body {
                    Div {
                        background(.red)
                        Paragraph {
                            color(.red)
                        }
                    }
                }
                Group {
                    Body {
                        background(.black)
                    }
                    Html {
                        background(.black)
                    }
                }
                .when(.colorScheme(.dark))
            }.string(),
            expects
        )
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
