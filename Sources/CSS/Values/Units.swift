//
//  Units.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Fraction: CustomStringConvertible {
    let top: Int
    let bottom: Int
    
    public init(_ top: Int, over bottom: Int) {
        self.top = top
        self.bottom = bottom
    }
    
    public var description: String {
        "\(top)/\(bottom)"
    }
}

/*
public func / (_ lhs: Int, _ rhs: Int) -> Fraction {
    Fraction(lhs, over: rhs)
}
*/

public enum CSSUnit {
    case pixels(Int)
    case points(Int)
    case em(Double)
    case rem(Double)
    case percent(Int)
    case auto
    case fraction(Int, Int)
    case calc(String)
    
    public var description: String {
        switch self {
        case let .pixels(a):
            return "\(a)px"
        case let .points(a):
            return "\(a)pt"
        case let .em(a):
            return "\(a)em"
        case let .rem(a):
            return "\(a)rem"
        case let .percent(a):
            return "\(a)%"
        case .auto:
            return "auto"
        case let .calc(a):
            return "calc(\(a))"
        case let .fraction(top, bottom):
            return Fraction(top, over: bottom).description
        }
    }
}
