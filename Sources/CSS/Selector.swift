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
        var res = ""
        let nested = children.filter { $0 is CSSSelector } as! [CSSSelector]
        for nest in nested {
            var select = Select()
            select.selector = "\(selector) \(nest.selector)"
            select.children = nest.children
            res += select.string()
        }
        let root = children.filter { !($0 is CSSSelector) }
        if root.count > 0 {
            res += """
            \(selector) {\(root.map { $0.string() }.reduce(into: "", { $0 += "\n \($1)" }))
            }
            """
        }
        return res
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
    
    public init(class cssClass: String, @CSSBuilder _ body: () -> CSS) {
        selector = ".\(cssClass)"
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
           children = [built]
       }
    }
    
    public init(id: String, @CSSBuilder _ body: () -> CSS) {
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

/// Select by `class` name. The leading `.` is added for you.
public func Class(_ className: String, @CSSBuilder _ body: () -> CSS) -> Select {
    Select(class: className, body)
}

/// Select by `id`. The leading `#` is added for you.
public func Id(_ id: String, @CSSBuilder _ body: () -> CSS) -> Select {
    Select(id: id, body)
}
