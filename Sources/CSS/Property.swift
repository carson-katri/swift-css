//
//  Property.swift
//
//
//  Created by Carson Katri on 9/4/19.
//

import Foundation

extension String {
    func dashCase() -> String {
        let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
        let normalPattern = "([a-z0-9])([A-Z])"
        return self.processCamalCaseRegex(pattern: acronymPattern)?
            .processCamalCaseRegex(pattern: normalPattern)?.lowercased() ?? self.lowercased()
    }
    
    fileprivate func processCamalCaseRegex(pattern: String) -> String? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2")
    }
}

public enum CSSProperty: String {
    public var description: String {
        self.rawValue.dashCase()
    }
    
    case alignContent
    case alignItems
    case alignSelf
    case all
    case animation
    case animationDelay
    case animationDirection
    case animationDuration
    case animationFillMode
    case animationIterationCount
    case animationName
    case animationPlayState
    case animationTimingFunction
    case azimuth
    case backfaceVisibility
    case backgroundAttachment
    case backgroundBlendMode
    case backgroundClip
    case backgroundColor
    case backgroundImage
    case backgroundOrigin
    case backgroundPosition
    case backgroundRepeat
    case backgroundSize
    case background
    case bleed
    case borderBottomColor
    case borderBottomLeftRadius
    case borderBottomRightRadius
    case borderBottomStyle
    case borderBottomWidth
    case borderBottom
    case borderCollapse
    case borderColor
    case borderImage
    case borderImageOutset
    case borderImageRepeat
    case borderImageSource
    case borderImageSlice
    case borderImageWidth
    case borderLeftColor
    case borderLeftStyle
    case borderLeftWidth
    case borderLeft
    case borderRadius
    case borderRightColor
    case borderRightStyle
    case borderRightWidth
    case borderRight
    case borderSpacing
    case borderStyle
    case borderTopColor
    case borderTopLeftRadius
    case borderTopRightRadius
    case borderTopStyle
    case borderTopWidth
    case borderTop
    case borderWidth
    case border
    case bottom
    case boxDecorationBreak
    case boxShadow
    case boxSizing
    case breakAfter
    case breakBefore
    case breakInside
    case captionSide
    case caretColor
    case clear
    case clip
    case color
    case columns
    case columnCount
    case columnFill
    case columnGap
    case columnRule
    case columnRuleColor
    case columnRuleStyle
    case columnRuleWidth
    case columnSpan
    case columnWidth
    case content
    case counterIncrement
    case counterReset
    case cueAfter
    case cueBefore
    case cue
    case cursor
    case direction
    case display
    case elevation
    case emptyCells
    case filter
    case flex
    case flexBasis
    case flexDirection
    case fontFeatureSettings
    case flexFlow
    case flexGrow
    case flexShrink
    case flexWrap
    case float
    case fontFamily
    case fontKerning
    case fontLanguageOverride
    case fontSizeAdjust
    case fontSize
    case fontStretch
    case fontStyle
    case fontSynthesis
    case fontVariant
    case fontVariantAlternates
    case fontVariantCaps
    case fontVariantEastAsian
    case fontVariantLigatures
    case fontVariantNumeric
    case fontVariantPosition
    case fontWeight
    case font
    case gridArea
    case gridAutoColumns
    case gridAutoFlow
    case gridAutoRows
    case gridColumnEnd
    case gridColumnGap
    case gridColumnStart
    case gridColumn
    case gridGap
    case gridRowEnd
    case gridRowGap
    case gridRowStart
    case gridRow
    case gridTemplateAreas
    case gridTemplateColumns
    case gridTemplateRows
    case gridTemplate
    case grid
    case hangingPunctuation
    case height
    case hyphens
    case isolation
    case justifyContent
    case justifyItems
    case justifySelf
    case left
    case letterSpacing
    case lineBreak
    case lineHeight
    case listStyleImage
    case listStylePosition
    case listStyleType
    case listStyle
    case marginBottom
    case marginLeft
    case marginRight
    case marginTop
    case margin
    case markerOffset
    case marks
    case maxHeight
    case maxWidth
    case minHeight
    case minWidth
    case mixBlendMode
    case navUp
    case navDown
    case navLeft
    case navRight
    case opacity
    case order
    case orphans
    case outlineColor
    case outlineOffset
    case outlineStyle
    case outlineWidth
    case outline
    case overflow
    case overflowWrap
    case overflowX
    case overflowY
    case paddingBottom
    case paddingLeft
    case paddingRight
    case paddingTop
    case padding
    case pageBreakAfter
    case pageBreakBefore
    case pageBreakInside
    case page
    case pauseAfter
    case pauseBefore
    case pause
    case perspective
    case perspectiveOrigin
    case pitchRange
    case pitch
    case placeContent
    case placeItems
    case placeSelf
    case playDuring
    case position
    case quotes
    case resize
    case restAfter
    case restBefore
    case rest
    case richness
    case right
    case size
    case speakHeader
    case speakNumeral
    case speakPunctuation
    case speak
    case speechRate
    case stress
    case tabSize
    case tableLayout
    case textAlign
    case textAlignLast
    case textDecoration
    case textDecorationColor
    case textDecorationLine
    case textDecorationSkip
    case textDecorationStyle
    case textIndent
    case textOverflow
    case textShadow
    case textTransform
    case textUnderlinePosition
    case top
    case transform
    case transformOrigin
    case transformStyle
    case transition
    case transitionDelay
    case transitionDuration
    case transitionProperty
    case transitionTimingFunction
    case unicodeBidi
    case verticalAlign
    case visibility
    case voiceBalance
    case voiceDuration
    case voiceFamily
    case voicePitch
    case voiceRange
    case voiceRate
    case voiceStress
    case voiceVolume
    case volume
    case whiteSpace
    case widows
    case width
    case willChange
    case wordBreak
    case wordSpacing
    case wordWrap
    case zIndex
}
