//
//  File.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum BorderStyle: String {
    case none
    case dotted
    case inset
    case dashed
}

public func border(_ color: Color, _ width: Int, _ style: BorderStyle) -> Declaration {
    Declaration(property: .border, value: "\(width)px \(style) \(color.description)")
}
