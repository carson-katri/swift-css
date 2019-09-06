//
//  Tag.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum Tags: String {
    case html
    case body
    case div
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case p
    case ul
    case ol
    case li
}

public struct Html: CSSSelector {
    public var selector = "html"
    public var children: [CSS] = []
    public init() { }
}

public struct Body: CSSSelector {
    public var selector = "body"
    public var children: [CSS] = []
    public init() { }
}

public struct Div: CSSSelector {
    public var selector = "div"
    public var children: [CSS] = []
    public init() { }
}

public struct Heading: CSSSelector {
    public var selector: String
    public var children: [CSS] = []
    
    public init(_ level: Int = 1, @CSSBuilder _ body: () -> CSS) {
        self.init(body)
        selector = "h\(level)"
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public init() { selector = "h1" }
}

public struct Paragraph: CSSSelector {
    public var selector = "p"
    public var children: [CSS] = []
    public init() { }
}

public struct List: CSSSelector {
    public var selector: String
    public var children: [CSS] = []
    
    public enum Ordered: String {
        case unordered = "ul"
        case ordered = "ol"
    }
    
    public init(_ ordered: Ordered = .unordered, @CSSBuilder _ body: () -> CSS) {
        self.init(body)
        selector = ordered.rawValue
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public init() { selector = Ordered.unordered.rawValue }
}

public struct ListItem: CSSSelector {
    public var selector = "li"
    public var children: [CSS] = []
    public init() { }
}
