//
//  Import.swift
//  
//
//  Created by Carson Katri on 9/5/19.
//

public struct Import: CSSBlock {
    public var children: [CSS] = []
    
    let url: Url
    let queries: [MediaQuery]
    
    public init(_ url: Url, when query: MediaQuery) {
        self.url = url
        queries = [query]
    }
    
    public init(_ url: Url, when queries: [MediaQuery]) {
        self.url = url
        self.queries = queries
    }
    
    public init(_ url: Url, when queries: MediaQuery...) {
        self.init(url, when: queries)
    }
    
    public func string() -> String {
        """
        @import \(url.description) \(queries.map { $0.description }.joined(separator: "and"));
        """
    }
}

public func importSheet(from url: Url, when query: MediaQuery) -> CSSBlock {
    Import(url, when: query)
}

public func importSheet(from url: Url, when queries: [MediaQuery] = []) -> CSSBlock {
    Import(url, when: queries)
}

public func importSheet(from url: Url, _ queries: MediaQuery...) -> CSSBlock {
    Import(url, when: queries)
}
