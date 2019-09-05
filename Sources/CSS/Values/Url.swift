//
//  Url.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Url: CustomStringConvertible, ExpressibleByStringLiteral {
    let href: String
    
    public init(_ link: String) {
        href = link
    }
    
    public init(stringLiteral value: String) {
        self.href = value
    }
    
    public var description: String {
        "url('\(href)')"
    }
}
