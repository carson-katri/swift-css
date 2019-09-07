//
//  Display.swift
//  
//
//  Created by Carson Katri on 9/7/19.
//

public enum DisplayMode: String {
    /// Displays an element as an inline element (like `<span>`). Any height and width properties will have no effect
    case inline
    /// Displays an element as a block element (like `<p>`). It starts on a new line, and takes up the whole width
    case block
    /// Makes the container disappear, making the child elements children of the element the next level up in the DOM
    case contents
    /// Displays an element as a block-level flex container
    case flex
    /// Displays an element as a block-level grid container
    case grid
    /// Displays an element as an inline-level block container. The element itself is formatted as an inline element, but you can apply height and width values
    case inlineBlock
    /// Displays an element as an inline-level flex container
    case inlineFlex
    /// Displays an element as an inline-level grid container
    case inlineGrid
    /// The element is displayed as an inline-level table
    case inlineTable
    /// Let the element behave like a `<li>` element
    case listItem
    /// Displays an element as either block or inline, depending on context
    case runIn
    /// Let the element behave like a `<table>` element
    case table
    /// Let the element behave like a `<caption>` element
    case tableCaption
    /// Let the element behave like a `<colgroup>` element
    case tableColumnGroup
    /// Let the element behave like a `<thead>` element
    case tableHeaderGroup
    /// Let the element behave like a `<tfoot>` element
    case tableFooterGroup
    /// Let the element behave like a `<tbody>` element
    case tableRowGroup
    /// Let the element behave like a `<td>` element
    case tableCell
    /// Let the element behave like a `<col>` element
    case tableColumn
    /// Let the element behave like a `<tr>` element
    case tableRow
    /// The element is completely remove
    case none
}

public func display(_ mode: DisplayMode) -> Declaration {
    Declaration(property: .display, value: mode.rawValue.dashCase())
}
