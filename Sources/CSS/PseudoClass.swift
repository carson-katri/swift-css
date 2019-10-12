//
//  PseudoClass.swift
//  
//
//  Created by Carson Katri on 10/11/19.
//

public enum PseudoClass: String, DashCaseConvertible {
    case active
    case anyLink
    case blank
    case checked
    case current
    case `default`
    case defined
    //case dir(TextDirection)
    case disabled
    case drop
    case empty
    case enabled
    case first
    case firstChild
    case firstOfType
    case fullscreen
    case future
    case focus
    case focusVisible
    case focusWithin
    //case has([String])
    case host
    //case host()
    //case host-context()
    case hover
    case indeterminate
    case inRange
    case invalid
    //case is()
    //case lang()
    case lastChild
    case lastOfType
    case left
    case link
    case localLink
    //case not()
    //case nth-child()
    //case nth-col()
    //case nth-last-child()
    //case nth-last-col()
    //case nth-last-of-type()
    //case nth-of-type()
    case onlyChild
    case onlyOfType
    case optional
    case outOfRange
    case past
    case placeholderShown
    case readOnly
    case readWrite
    case required
    case right
    case root
    case scope
    case target
    case targetWithin
    case userInvalid
    case valid
    case visited
    //case where()
}

public extension CSSSelector {
    func pseudo(_ pseudos: PseudoClass...) -> CSSSelector {
        Select(selector + pseudos.map { ":\($0.description)" }.joined(separator: ""), children)
    }
    
    // Pseudo Elements (not fully implemented)
    func before() -> CSSSelector {
        Select(selector + "::before", children)
    }
    
    func after() -> CSSSelector {
        Select(selector + "::after", children)
    }
}
