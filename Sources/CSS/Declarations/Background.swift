//
//  Background.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

/// Specify how background images are repeated
public enum BackgroundRepeat: String {
    case `repeat`
    case x = "repeat-x"
    case y = "repeat-y"
    case none = "no-repeat"
    case space
    case round
    case intial
    case inherit
}

/// Specify whether the background is fixed within the viewport, or scrolls with its containing block
public enum BackgroundAttachment: String {
    /// The background image will scroll with the page
    case scroll
    /// The background image will not scroll with the page
    case fixed
    /// The background image will scroll with the element's contents
    case local
    /// Sets this property to its default value
    case initial
    /// Inherits this property from its parent element
    case inherit
}

public enum BackgroundPosition {
    case leftTop
    case leftCenter
    case leftBottom
    case rightTop
    case rightCenter
    case rightBottom
    case centerTop
    case centerCenter
    case centerBottom
    
    case percent(x: Int, y: Int)
    case coords(x: CSSUnit, y: CSSUnit)
    
    public var description: String {
        switch self {
        case let .percent(x, y):
            return "\(x)% \(y)%"
        case let .coords(x, y):
            return "\(x.description) \(y.description)"
        default:
            return String(describing: self)
        }
    }
}

/// Set the background `Color`
public func background(_ color: Color, _ image: Url, _ bgRepeat: BackgroundRepeat, _ attachment: BackgroundAttachment = .scroll, _ position: BackgroundPosition) -> Declaration {
    Declaration(property: .background, value: "\(color.description) \(image.description) \(bgRepeat.rawValue) \(attachment.rawValue) \(position.description)")
}

/// Set the background `Color`
public func background(_ color: Color) -> Declaration {
    Declaration(property: .backgroundColor, value: color.description)
}

/// Sets the background `Image` at a specified `Url`
public func background(_ image: Url, repeat bgRepeat: BackgroundRepeat = .none, attachment: BackgroundAttachment = .scroll, position: BackgroundPosition) -> Declaration {
    Declaration(property: .background, value: "\(image.description) \(bgRepeat.rawValue) \(attachment.rawValue) \(position.description)")
}
