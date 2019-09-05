//
//  Media.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum MediaQuery {
    case screen
    case print
    
    public enum ColorScheme: String {
        case light
        case dark
    }
    case colorScheme(ColorScheme)
    
    case aspectRatio(Fraction)
    
    public var description: String {
        switch self {
        case let .colorScheme(colorScheme):
            return "(prefers-color-scheme: \(colorScheme.rawValue))"
        case let .aspectRatio(fraction):
            return "(aspect-ratio: \(fraction.description))"
        default:
            return String(describing: self).dashCase()
        }
    }
}

public struct Media: CSSBlock {
    public var children: [CSS]
    
    let queries: [MediaQuery]
    
    public init(_ query: MediaQuery, @StylesheetBuilder _ body: () -> CSSBlock) {
        self.init([query], body)
    }
    
    public init(_ queries: [MediaQuery], @StylesheetBuilder _ body: () -> CSSBlock) {
        self.queries = queries
        let extracted = body()
        if extracted is CSSSelector || extracted is Media {
            children = [extracted]
        } else {
            children = extracted.children
        }
    }
    
    public func string() -> String {
        """
        @media \(queries.map { $0.description }.joined(separator: "and")) {
          \(children.map { $0.string() }.joined(separator: "\n"))
        }
        """
    }
}

public extension CSSSelector {
    func when(_ query: MediaQuery) -> Media {
        Media(query) {
            self
        }
    }
    func when(_ queries: MediaQuery...) -> Media {
        Media(queries) {
            self
        }
    }
    func when(_ queries: [MediaQuery]) -> Media {
        Media(queries) {
            self
        }
    }
}

public extension Group {
    func when(_ query: MediaQuery) -> Media {
        Media(query) {
            CSSContainer(children: self.children)
        }
    }
    func when(_ queries: MediaQuery...) -> Media {
        Media(queries) {
            CSSContainer(children: self.children)
        }
    }
    func when(_ queries: [MediaQuery]) -> Media {
        Media(queries) {
            CSSContainer(children: self.children)
        }
    }
}

public extension Declaration {
    func when(_ query: MediaQuery) -> ConditionalDeclaration {
        ConditionalDeclaration(self, queries: [query])
    }
    func when(_ queries: MediaQuery...) -> ConditionalDeclaration {
        ConditionalDeclaration(self, queries: queries)
    }
    func when(_ queries: [MediaQuery]) -> ConditionalDeclaration {
        ConditionalDeclaration(self, queries: queries)
    }
}
