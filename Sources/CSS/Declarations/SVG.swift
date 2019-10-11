//
//  SVG.swift
//  
//
//  Created by Carson Katri on 10/11/19.
//

public enum LinecapMode: String {
    case butt
    case square
    case round
}

public func stroke(_ color: Color) -> Declaration {
    Declaration(property: .stroke, value: color.description)
}

public func strokeWidth(_ width: CSSUnit) -> Declaration {
    Declaration(property: .strokeWidth, value: width.description)
}

public func strokeDasharray(_ length: CSSUnit) -> Declaration {
    Declaration(property: .strokeDasharray, value: length.description)
}

public func strokeDashoffset(_ offset: CSSUnit) -> Declaration {
    Declaration(property: .strokeDashoffset, value: offset.description)
}

public func strokeLinecap(_ capMode: LinecapMode) -> Declaration {
    Declaration(property: .strokeLinecap, value: capMode.rawValue)
}

public func fill(_ color: Color) -> Declaration {
    Declaration(property: .fill, value: color.description)
}
