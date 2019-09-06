//
//  List.swift
//  
//
//  Created by Carson Katri on 9/6/19.
//

public enum ListType {
    /// Default value. The marker is a filled circle
    case disc
    /// The marker is traditional Armenian numbering
    case armenian
    /// The marker is a circle
    case circle
    /// The marker is plain ideographic numbers
    case cjkIdeographic
    /// The marker is a number
    case decimal
    /// The marker is a number with leading zeros (01, 02, 03, etc.)
    case decimalLeadingZero
    /// The marker is traditional Georgian numbering
    case georgian
    /// The marker is traditional Hebrew numbering
    case hebrew
    /// The marker is traditional Hiragana numbering
    case hiragana
    /// The marker is traditional Hiragana iroha numbering
    case hiraganaIroha
    /// The marker is traditional Katakana numbering
    case katakana
    /// The marker is traditional Katakana iroha numbering
    case katakanaIroha
    /// The marker is lower-alpha (a, b, c, d, e, etc.)
    case lowerAlpha
    /// The marker is lower-greek
    case lowerGreek
    /// The marker is lower-latin (a, b, c, d, e, etc.)
    case lowerLatin
    /// The marker is lower-roman (i, ii, iii, iv, v, etc.)
    case lowerRoman
    /// No marker is shown
    case none
    /// The marker is a square
    case square
    /// The marker is upper-alpha (A, B, C, D, E, etc.)
    case upperAlpha
    /// The marker is upper-greek
    case upperGreek
    /// The marker is upper-latin (A, B, C, D, E, etc.)
    case upperLatin
    /// The marker is upper-roman (I, II, III, IV, V, etc.)
    case upperRoman
    /// Inherits this property from its parent element. Read about inherit
    
    public var description: String {
        String(describing: self).dashCase()
    }
}

public enum ListPosition: String {
    /// The bullet points will be inside the list item
    case inside
    /// The bullet points will be outside the list item. This is default
    case outside
}

/// Specify list properties (for `ul`/`ol`)
public func listStyle(_ type: ListType, _ position: ListPosition, _ image: Url) -> Declaration {
    Declaration(property: .listStyle, value: "\(type.description) \(position.rawValue) \(image.description)")
}

public func listStyle(_ type: ListType) -> Declaration {
    Declaration(property: .listStyleType, value: type.description)
}

public func listStyle(_ position: ListPosition) -> Declaration {
    Declaration(property: .listStylePosition, value: position.rawValue)
}

public func listStyle(_ image: Url) -> Declaration {
    Declaration(property: .listStyleImage, value: image.description)
}
