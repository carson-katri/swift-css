//
//  File.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum BorderStyle: String {
    case none
    case solid
    case dotted
    case dashed
    case double
    case groove
    case inset
    case outset
}

public func border(sides: [Side] = [.top, .right, .bottom, .left], _ color: Color, _ width: CSSUnit, _ style: BorderStyle) -> Declaration {
    Declaration(code: sides.map {
        "border-\($0.rawValue): \(width.description) \(style.rawValue) \(color.description);"
    }.joined(separator: " "))
}

public func border(_ style: BorderStyle) -> Declaration {
    Declaration(property: .border, value: style.rawValue)
}

public func borderRadius(_ radius: CSSUnit) -> Declaration {
    Declaration(property: .borderRadius, value: radius.description)
}
