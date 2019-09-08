import XCTest
@testable import CSS

final class CSSTests: XCTestCase {
    func testGroups() {
        let expects =
        """
        div .hello-world p {
         background-color: red;
        }
        div .hello-world {
         color: blue;
        }
        div .hi {
         color: green;
        }

        div {
         background-color: green;
        }
        @media (prefers-color-scheme: dark) {
          div {
         color: black;
         background-color: white;
        }

        }
        """
        XCTAssertEqual(
            Stylesheet {
                Select(.div) {
                    Group {
                        color(.black)
                        background(.white)
                    }
                    .when(.colorScheme(.dark))
                    Group {
                        background(.green)
                        Class("hello-world") {
                            color(.blue)
                            Paragraph {
                                background(.red)
                            }
                        }
                        Class("hi") {
                            color(.green)
                        }
                    }
                }
            }.string(),
            expects
        )
    }
    
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
          p {
         border-top: 5px dashed blue; border-right: 5px dashed blue; border-bottom: 5px dashed blue; border-left: 5px dashed blue;
        }

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
                    border(.blue, .pixels(5), .dashed)
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
    
    func testParent() {
        let styles = Stylesheet {
            Class("hello-world") {
                background(.red)
                Parent {
                    Class("blue") {
                        background(.blue)
                    }
                }
            }
        }
        print(styles.string())
    }

    static var allTests = [
        ("testGroups", testGroups),
        ("testExample", testExample),
    ]
}
