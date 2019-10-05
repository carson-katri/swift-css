//
//  Filter.swift
//  
//
//  Created by Carson Katri on 10/5/19.
//

enum Filter {
    case blur(CSSUnit)
    case invert(CSSUnit)
    
    var description: String {
        switch self {
        case let .blur(size):
            return "blur(\(size.description))"
        case let .invert(amount):
            return "invert(\(amount.description))"
        }
    }
}

func filter(_ filter: Filter) -> Declaration {
    Declaration(property: .filter, value: filter.description)
}
