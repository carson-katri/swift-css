//
//  Size.swift
//  
//
//  Created by Carson Katri on 9/6/19.
//

public func size(width: CSSUnit, height: CSSUnit) -> Declaration {
    Declaration(code: "width: \(width.description); height: \(height.description);")
}

public func minWidth(_ min: CSSUnit) -> Declaration {
    Declaration(property: .minWidth, value: min.description)
}

public func maxWidth(_ max: CSSUnit) -> Declaration {
    Declaration(property: .maxWidth, value: max.description)
}

public func minHeight(_ min: CSSUnit) -> Declaration {
    Declaration(property: .minHeight, value: min.description)
}

public func maxHeight(_ max: CSSUnit) -> Declaration {
    Declaration(property: .maxHeight, value: max.description)
}

/// Set the width of the element
public func width(_ size: CSSUnit) -> Declaration {
    Declaration(property: .width, value: size.description)
}

public func width(min: CSSUnit, max: CSSUnit) -> Declaration {
    Declaration(code: "min-width: \(min.description); max-width: \(max.description);")
}

/// Set the height of the element
public func height(_ size: CSSUnit) -> Declaration {
    Declaration(property: .height, value: "\(size.description)")
}

public func height(min: CSSUnit, max: CSSUnit) -> Declaration {
    Declaration(code: "min-height: \(min.description); max-height: \(max.description);")
}


public enum Overflow: String {
    case visible
    case hidden
    case scroll
    case auto
}

/// Specify how to handle overflow
public func overflow(x: Overflow, y: Overflow) -> Declaration {
    Declaration(code: "overflow-x: \(x.rawValue); overflow-y: \(y.rawValue);")
}

public func overflow(x: Overflow) -> Declaration {
    Declaration(property: .overflowX, value: x.rawValue)
}

public func overflow(y: Overflow) -> Declaration {
    Declaration(property: .overflowY, value: y.rawValue)
}

public func overflow(_ xAndY: Overflow) -> Declaration {
    Declaration(property: .overflow, value: xAndY.rawValue)
}
