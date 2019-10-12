//
//  Text.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public enum Font {
    case sansSerif
    case serif
    case monospace
    case family(String)
    
    public var description: String {
        switch self {
        case let .family(fontName):
            return fontName
        default:
            return String(describing: self).dashCase()
        }
    }
}

public enum TextDirection: String {
    case rtl
    case ltr
}
