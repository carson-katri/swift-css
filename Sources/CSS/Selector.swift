//
//  Selector.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public protocol CSSSelector: CSSBlock {
    var selector: String { get set }
    
    init()
    init(_ body: () -> CSS)
}

public extension CSSSelector {    
    func string() -> String {
        print(children)
        return """
        \(selector) {\(children.map { $0.string() }.reduce(into: "", { $0 += "\n \($1)" }))
        }
        """
    }
    
    init(@CSSBuilder _ body: () -> CSS) {
        self.init()
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
}

public struct Select: CSSSelector {
    public var selector: String = "*"
    public var children: [CSS] = []
    
    public init(_ tag: Tags, @CSSBuilder _ body: () -> CSS) {
        selector = tag.rawValue
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public init(_ cssClass: CSSClass, @CSSBuilder _ body: () -> CSS) {
        selector = ".\(cssClass.rawValue)"
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
           children = [built]
       }
    }
    
    public init(_ id: String, @CSSBuilder _ body: () -> CSS) {
        selector = "#\(id)"
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
           children = [built]
       }
    }
    
    public init() { }
}
