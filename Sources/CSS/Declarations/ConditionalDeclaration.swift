//
//  ConditionalDeclaration.swift
//  
//
//  Created by Carson Katri on 9/5/19.
//

/// A `Declaration` that also contains `MediaQueries` so that you can more declaratively define when a `Declaration` should be conditional
public struct ConditionalDeclaration: CSS {
    let declaration: Declaration
    let queries: [MediaQuery]
    
    public init(_ declaration: Declaration, query: MediaQuery) {
        self.declaration = declaration
        self.queries = [query]
    }
    
    public init(_ declaration: Declaration, queries: [MediaQuery]) {
        self.declaration = declaration
        self.queries = queries
    }
    
    public init(_ declaration: Declaration, queries: MediaQuery...) {
        self.declaration = declaration
        self.queries = queries
    }
    
    public func string() -> String {
        declaration.string()
    }
}
