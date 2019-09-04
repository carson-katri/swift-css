//
//  Stylesheet.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Stylesheet: CSSBlock {
    public var children: [CSS] = []
    
    public init(@StylesheetBuilder _ body: () -> CSSBlock) {
        children = body().children
    }
    
    public init(_ body: [CSS]) {
        children = body
    }
    
    public func string() -> String {
        children.map { $0.string() }.joined(separator: "\n")
    }
}
