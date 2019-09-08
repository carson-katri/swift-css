//
//  Colors.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct RGB: CustomStringConvertible {
    let red: Int
    let green: Int
    let blue: Int
    let alpha: Double
    
    public init(_ red: Int, _ green: Int, _ blue: Int, alpha: Double = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public var description: String {
        "rgba(\(red),\(green),\(blue),\(alpha))"
    }
}

public struct Hex<Number>: CustomStringConvertible where Number: BinaryInteger {
    let value: Number
    
    public init(_ value: Number) {
        self.value = value
    }
    
    public var description: String {
        "#\(String(value, radix: 16, uppercase: true))"
    }
}

fileprivate extension ClosedRange {
    func clamp(value : Bound) -> Bound {
        return lowerBound > value ? lowerBound
            : upperBound < value ? upperBound
            : value
    }
}

public struct HSL: CustomStringConvertible {
    let hue: Int
    let saturation: Int
    let lightness: Int
    
    public init(_ hue: Int, _ saturationPercent: Int, _ lightnessPercent: Int) {
        self.hue = hue
        saturation = (0...100).clamp(value: saturationPercent)
        lightness = (0...100).clamp(value: lightnessPercent)
    }
    
    public var description: String {
        "hsl(\(hue), \(saturation)%, \(lightness)%)"
    }
}

public struct LinearGradient: CustomStringConvertible {
    public enum Direction {
        case toTop
        case toRight
        case toBottom
        case toLeft
        case degrees(Int)
        case radians(Double)
    }
    let direction: Direction
    let stops: [String]
    
    public init(_ direction: Direction, _ stops: Color...) {
        self.init(direction, stops)
    }
    
    public init(_ direction: Direction, _ stops: [Color]) {
        self.direction = direction
        self.stops = stops.map { $0.description }
    }
    
    public var description: String {
        var dir = ""
        switch direction {
        case .degrees(let deg):
            dir = "\(deg)deg"
        case .radians(let rad):
            dir = "\(rad)rad"
        default:
            dir = String(describing: direction).dashCase().replacingOccurrences(of: "-", with: " ")
        }
        return "linear-gradient(\(dir), \(stops.joined(separator: ", ")))"
    }
}

public enum Color {
    case rgb(_ red: Int, _ green: Int, _ blue: Int, alpha: Double = 1.0)
    
    case rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double)
    
    case hex(_ value: Int)
    
    case hsl(_ hue: Int, _ saturationPercent: Int, _ lightnessPercent: Int)
    
    case linearGradient(_ direction: LinearGradient.Direction, _ stops: [Color])
    
    // Builtins
    case white
    case black
    case red
    case green
    case blue
    
    static func linearGradient(_ direction: LinearGradient.Direction, _ stops: Color...) -> Color {
        .linearGradient(direction, stops)
    }
    
    public var description: String {
        switch self {
        case let .rgb(red, green, blue, alpha):
            return RGB(red, green, blue, alpha: alpha).description
        case let .rgba(red, green, blue, alpha):
            return RGB(red, green, blue, alpha: alpha).description
        case let .hex(value):
            return Hex(value).description
        case let .hsl(hue, saturation, lightness):
            return HSL(hue, saturation, lightness).description
        case let .linearGradient(dir, stops):
            return LinearGradient(dir, stops).description
        default:
            return String(describing: self)
        }
    }
}
