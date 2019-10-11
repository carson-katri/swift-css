//
//  FlexBox.swift
//  
//
//  Created by Carson Katri on 10/11/19.
//

// MARK: Flexbox

public enum FlexDirection: String, DashCaseConvertible {
    case column
    case columnReverse
    case row
    case rowReverse
}

public func flexDirection(_ dir: FlexDirection) -> Declaration {
    Declaration(property: .flexDirection, value: dir.description)
}

public enum FlexWrap: String, DashCaseConvertible {
    case wrap
    case nowrap
    case wrapReverse
}

public func flexWrap(_ wrap: FlexWrap) -> Declaration {
    Declaration(property: .flexWrap, value: wrap.description)
}

public func flexFlow(_ dir: FlexDirection, _ wrap: FlexWrap) -> Declaration {
    Declaration(code: "flex-flow: \(dir.description) \(wrap.description)")
}

public enum FlexJustification: String, DashCaseConvertible {
    case center
    case flexStart
    case flexEnd
    case spaceAround
    case spaceBetween
}

public enum FlexAlignment: String, DashCaseConvertible {
    case center
    case flexStart
    case flexEnd
    case stretch
    case baseline
}

public enum FlexContentAlignment: String, DashCaseConvertible {
    case center
    case flexStart
    case flexEnd
    case stretch
    case baseline
    case spaceAround
    case spaceBetween
}

public func justifyContent(_ just: FlexJustification) -> Declaration {
    Declaration(property: .justifyContent, value: just.description)
}

public func alignItems(_ align: FlexAlignment) -> Declaration {
    Declaration(property: .alignItems, value: align.description)
}

public func alignContent(_ align: FlexContentAlignment) -> Declaration {
    Declaration(property: .alignContent, value: align.description)
}

// MARK: Children

public func order(_ order: Int) -> Declaration {
    Declaration(property: .order, value: "\(order)")
}

public func flexGrow(_ grow: Int) -> Declaration {
    Declaration(property: .flexGrow, value: "\(grow)")
}

public func flexShrink(_ shrink: Int) -> Declaration {
    Declaration(property: .flexShrink, value: "\(shrink)")
}

public func flexBasis(_ length: CSSUnit) -> Declaration {
    Declaration(property: .flexBasis, value: length.description)
}

public func flex(grow: Int, shrink: Int, basis: CSSUnit) -> Declaration {
    Declaration(property: .flex, value: "\(grow) \(shrink) \(basis.description)")
}

public func alignSelf(_ align: FlexAlignment) -> Declaration {
    Declaration(property: .alignSelf, value: align.description)
}
