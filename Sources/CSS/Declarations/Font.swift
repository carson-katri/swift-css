//
//  Font.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

/// Specify the font of text in the element
public func font(_ font: Font) -> Declaration {
    Declaration(property: .fontFamily, value: font.description)
}

/// Specify multiple font parameters
public func font(_ fonts: Font...) -> Declaration {
    Declaration(property: .fontFamily, value: fonts.map { $0.description }.joined(separator: ", "))
}

/// Specify the size of the font
public func fontSize(_ size: CSSUnit) -> Declaration {
    Declaration(property: .fontSize, value: size.description)
}

/// Builtin weights
public enum FontWeight: String {
    case normal
    case bold
    /// Relative to the parent
    case lighter
    /// Relative to the parent
    case bolder
}

/// Specify the weight (or boldness) of the font
public func fontWeight(_ weight: FontWeight) -> Declaration {
    Declaration(property: .fontWeight, value: weight.rawValue)
}

/// Specify the weight (or boldness) of the font
public func fontWeight(_ weight: Int) -> Declaration {
    Declaration(property: .fontWeight, value: "\(weight)")
}

public enum FontStyle {
    case normal
    case italic
    /// While `italic` is typically cursive, `oblique` is just slanted.
    case oblique(deg: Int = 45)
    
    public var description: String {
        switch self {
        case let .oblique(deg):
            return "oblique \(deg)deg"
        default:
            return String(describing: self).dashCase()
        }
    }
}

/// Specify the style of the font
public func fontStyle(_ style: FontStyle) -> Declaration {
    Declaration(property: .fontStyle, value: style.description)
}

/// Alignment of the text
public enum TextAlignment: String {
    case left
    case center
    case right
    case justify
}

public func textAlign(_ alignment: TextAlignment) -> Declaration {
    Declaration(property: .textAlign, value: alignment.rawValue)
}
