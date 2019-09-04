//
//  Url.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Url: CustomStringConvertible {
    let href: String
    
    init(_ link: String) {
        href = link
    }
    
    public var description: String {
        "url(\(href))"
    }
}
