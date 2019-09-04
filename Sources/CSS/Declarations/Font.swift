//
//  Font.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

///
public func font(_ font: Font) -> Declaration {
    Declaration(property: .fontFamily, value: font.description)
}

/// Specify the size of the font (in `Pixels`)
public func fontSize(_ size: Pixel) -> Declaration {
    Declaration(property: .fontSize, value: "\(size)px")
}

/// Specify the size of the font (in `Points`)
public func fontSize(points size: Point) -> Declaration {
    Declaration(property: .fontSize, value: "\(size)pt")
}

/// Specify the size of the font (in `Ems`)
public func fontSize(ems size: Em) -> Declaration {
    Declaration(property: .fontSize, value: "\(size)em")
}

/// Specify the size of the font (in `Rems`)
public func fontSize(rems size: Rem) -> Declaration {
    Declaration(property: .fontSize, value: "\(size)rem")
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
