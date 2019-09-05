//
//  CSSBuilder.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

@_functionBuilder
public struct CSSBuilder {
    public static func buildBlock(_ css: CSS...) -> CSS {
        CSSContainer(children: css)
    }
}

@_functionBuilder
public struct StylesheetBuilder {
    public static func buildBlock(_ css: CSSBlock) -> CSSBlock {
        CSSContainer(children: [css])
    }
    
    public static func buildBlock(_ css: CSSBlock...) -> CSSBlock {
        CSSContainer(children: css)
    }
}
