//
//  CSS.swift
//
//
//  Created by Carson Katri on 9/4/19.
//

public protocol CSS {
    func string() -> String
}

public protocol CSSBlock: CSS {
    var children: [CSS] { get set }
}

public struct CSSContainer: CSSBlock {
    public var children: [CSS]
    
    public func string() -> String {
        children.map { $0.string() }.joined(separator: "\n")
    }
}
