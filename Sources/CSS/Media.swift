//
//  Media.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum MediaQuery {
    public var description: String {
        switch self {
        case let .prefersColorScheme(colorScheme):
            return "(prefers-color-scheme: \(colorScheme.rawValue))"
        default:
            return String(describing: self).dashCase()
        }
    }
    public enum ColorScheme: String {
        case light
        case dark
    }
    case prefersColorScheme(ColorScheme)
}

public struct Media: CSSBlock {
    public var children: [CSS]
    
    let query: MediaQuery
    
    public init(_ query: MediaQuery, @StylesheetBuilder _ body: () -> CSSBlock) {
        self.query = query
        children = body().children
    }
    
    public func string() -> String {
        """
        @media \(query.description) {
          \(children.map { $0.string() }.joined(separator: "\n"))
        }
        """
    }
}
