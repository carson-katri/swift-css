//
//  Stylesheet.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Stylesheet: CSSBlock {
    public var children: [CSS] = []
    
    public init(@StylesheetBuilder _ body: () -> CSSBlock) {
        let extracted = body()
        if extracted is CSSSelector || extracted is Media {
            children = [extracted]
        } else {
            children = body().children
        }
    }
    
    public init(_ body: [CSS]) {
        children = body
    }
    
    public func string() -> String {
        print(children)
        return children.map { $0.string() }.joined(separator: "\n")
    }
}
