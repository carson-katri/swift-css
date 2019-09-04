//
//  Color.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

/// Set the text `Color`
public func color(_ color: Color) -> Declaration {
    Declaration(property: .color, value: color.description)
}
