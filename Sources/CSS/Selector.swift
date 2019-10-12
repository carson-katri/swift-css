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
        let conditional = children.filter { $0 is ConditionalDeclaration } as! [ConditionalDeclaration]
        var conditionalRes = ""
        for condition in conditional {
            var select = Select()
            select.selector = selector
            select.children = [condition.declaration]
            conditionalRes += Media(condition.queries, { select }).string()
        }
        let media = children.filter { $0 is Media } as! [Media]
        for condition in media {
            var select = Select()
            select.selector = selector
            select.children = condition.children
            conditionalRes += Media(condition.queries, { select }).string()
        }
        let groups = children.filter { $0 is Group } as! [Group]
        for group in groups {
            let blocks = group.children.filter { $0 is CSSBlock }
            let decls = group.children.filter { !($0 is CSSBlock) }
            var select = Select()
            select.selector = selector
            select.children = blocks
            res += select.string()
            res += """
            \(selector) {\(decls.map { $0.string() }.reduce(into: "", { $0 += "\n \($1)" }))
            }
            """
        }
        let parents = children.filter { $0 is Parent } as! [Parent]
        for parent in parents {
            let selectors = parent.children.filter { $0 is CSSSelector } as! [CSSSelector]
            for block in selectors {
                var select = Select()
                // Merge the selectors
                select.selector = "\(selector)\(block.selector)"
                select.children = block.children
                res += select.string()
            }
        }
        let childCombinators = children.filter { $0 is Child } as! [Child]
        for child in childCombinators {
            let selectors = child.children.filter { $0 is CSSSelector } as! [CSSSelector]
            for block in selectors {
                var select = Select()
                select.selector = "\(selector) > \(block.selector)"
                select.children = block.children
                res += select.string()
            }
        }
        let root = children.filter { !($0 is CSSSelector || $0 is ConditionalDeclaration || $0 is Media || $0 is Group || $0 is Parent || $0 is Child) }
        if root.count > 0 {
            res += """
            \(selector) {\(root.map { $0.string() }.reduce(into: "", { $0 += "\n \($1)" }))
            }
            """
        }
        return "\(res)\n\(conditionalRes)"
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
        self.init(tag.description, body)
    }
    
    public init(class cssClass: String, @CSSBuilder _ body: () -> CSS) {
        self.init(".\(cssClass)", body)
    }
    
    public init(id: String, @CSSBuilder _ body: () -> CSS) {
        self.init("#\(id)", body)
    }
    
    public init(_ custom: String, @CSSBuilder _ body: () -> CSS) {
        let built = body()
        if let container = built as? CSSContainer {
            self.init(custom, container.children)
        } else {
            self.init(custom, [built])
        }
    }
    
    public init(_ custom: String, _ children: [CSS]) {
        selector = custom
        self.children = children
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

/// Get the parent, and apply following to them
public struct Parent: CSSBlock {
    public var children: [CSS]
    
    public init(@StylesheetBuilder _ body: () -> CSSBlock) {
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public func string() -> String {
        children.map { $0.string() }.joined(separator: "\n")
    }
}

/// The child combinator (a direct descendent of the parent)
public struct Child: CSSBlock {
    public var children: [CSS]
    
    public init(@StylesheetBuilder _ body: () -> CSSBlock) {
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public func string() -> String {
        children.map { $0.string() }.joined(separator: "\n")
    }
}
