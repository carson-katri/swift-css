//
//  Declaration.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Declaration: CSS {
    let property: CSSProperty
    let value: String
    
    public func string() -> String {
        "\(property.description.replacingOccurrences(of: "_", with: "-")): \(value);"
    }
}
