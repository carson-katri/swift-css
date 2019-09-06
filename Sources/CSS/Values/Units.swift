//
//  Units.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

/// pixels (1px = 1/96th of 1in)
public typealias Pixel = Int
/// (1pt = 1/72 of 1in)
public typealias Point = Int
/// Relative to the font-size of the element (2em means 2 times the size of the current font)
public typealias Em = Int
/// Relative to font-size of the root element
public typealias Rem = Int

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
    case em(Int)
    case rem(Int)
    case auto
    case fraction(Int, Int)
    
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
        case .auto:
            return "auto"
        case let .fraction(top, bottom):
            return Fraction(top, over: bottom).description
        }
    }
}
