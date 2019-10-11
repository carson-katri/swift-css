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

public struct RadialGradient: CustomStringConvertible {
    public enum Shape: String {
        case ellipse
        case circle
    }
    
    public enum Size: String, DashCaseConvertible {
        case farthestCorner
        case closestSide
        case closestCorner
        case farthestSide
    }
    
    let shape: Shape
    let size: Size
    let position: BackgroundPosition
    let stops: [String]
    
    public init(shape: Shape = .ellipse, size: Size = .farthestCorner, at position: BackgroundPosition = .centerCenter, _ stops: Color...) {
        self.init(shape: shape, size: size, at: position, stops)
    }
    
    public init(shape: Shape = .ellipse, size: Size = .farthestCorner, at position: BackgroundPosition = .centerCenter, _ stops: [Color]) {
        self.shape = shape
        self.size = size
        self.position = position
        self.stops = stops.map { $0.description }
    }
    
    public var description: String {
        "radial-gradient(\(shape.rawValue) \(size.rawValue) at \(position.description), \(stops.joined(separator: ", ")))"
    }
}

public enum Color {
    case rgb(_ red: Int, _ green: Int, _ blue: Int, alpha: Double = 1.0)
    
    case rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double)
    
    case hex(_ value: Int)
    
    case hsl(_ hue: Int, _ saturationPercent: Int, _ lightnessPercent: Int)
    
    case linearGradient(_ direction: LinearGradient.Direction, _ stops: [Color])
    
    case radialGradient(shape: RadialGradient.Shape, size: RadialGradient.Size, at: BackgroundPosition, _ stops: [Color])
    
    // Builtins
    case aliceblue
    case antiquewhite
    case aqua
    case aquamarine
    case azure
    case beige
    case bisque
    case black
    case blanchedalmond
    case blue
    case blueviolet
    case brown
    case burlywood
    case cadetblue
    case chartreuse
    case chocolate
    case coral
    case cornflowerblue
    case cornsilk
    case crimson
    case cyan
    case darkblue
    case darkcyan
    case darkgoldenrod
    case darkgray
    case darkgreen
    case darkgrey
    case darkkhaki
    case darkmagenta
    case darkolivegreen
    case darkorange
    case darkorchid
    case darkred
    case darksalmon
    case darkseagreen
    case darkslateblue
    case darkslategray
    case darkslategrey
    case darkturquoise
    case darkviolet
    case deeppink
    case deepskyblue
    case dimgray
    case dimgrey
    case dodgerblue
    case firebrick
    case floralwhite
    case forestgreen
    case fuchsia
    case gainsboro
    case ghostwhite
    case gold
    case goldenrod
    case gray
    case green
    case greenyellow
    case grey
    case honeydew
    case hotpink
    case indianred
    case indigo
    case ivory
    case khaki
    case lavender
    case lavenderblush
    case lawngreen
    case lemonchiffon
    case lightblue
    case lightcoral
    case lightcyan
    case lightgoldenrodyellow
    case lightgray
    case lightgreen
    case lightgrey
    case lightpink
    case lightsalmon
    case lightseagreen
    case lightskyblue
    case lightslategray
    case lightslategrey
    case lightsteelblue
    case lightyellow
    case lime
    case limegreen
    case linen
    case magenta
    case maroon
    case mediumaquamarine
    case mediumblue
    case mediumorchid
    case mediumpurple
    case mediumseagreen
    case mediumslateblue
    case mediumspringgreen
    case mediumturquoise
    case mediumvioletred
    case midnightblue
    case mintcream
    case mistyrose
    case moccasin
    case navajowhite
    case navy
    case oldlace
    case olive
    case olivedrab
    case orange
    case orangered
    case orchid
    case palegoldenrod
    case palegreen
    case paleturquoise
    case palevioletred
    case papayawhip
    case peachpuff
    case peru
    case pink
    case plum
    case powderblue
    case purple
    case rebeccapurple
    case red
    case rosybrown
    case royalblue
    case saddlebrown
    case salmon
    case sandybrown
    case seagreen
    case seashell
    case sienna
    case silver
    case skyblue
    case slateblue
    case slategray
    case slategrey
    case snow
    case springgreen
    case steelblue
    case tan
    case teal
    case thistle
    case tomato
    case turquoise
    case violet
    case wheat
    case white
    case whitesmoke
    case yellow
    case yellowgreen
    
    public static func linearGradient(_ direction: LinearGradient.Direction, _ stops: Color...) -> Color {
        .linearGradient(direction, stops)
    }
    
    public static func radialGradient(shape: RadialGradient.Shape = .ellipse, size: RadialGradient.Size = .farthestCorner, at position: BackgroundPosition = .centerCenter, _ stops: Color...) -> Color {
        .radialGradient(shape: shape, size: size, at: position, stops)
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
        case let .radialGradient(shape: shape, size: size, at: pos, stops):
            return RadialGradient(shape: shape, size: size, at: pos, stops).description
        default:
            return String(describing: self)
        }
    }
}
