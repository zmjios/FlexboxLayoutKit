//
//  FlexboxEnums.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/11.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import Foundation

//this enum is wrap for yoga's enum

public enum FBFlexDirection:Int,RawRepresentable,FlexboxConstantTarget {
    case column = 0
    case columnReverse
    case row
    case rowReverse
    case count
    
    //public typealias RawValue = YGFlexDirection
    
    public init(rawValue: YGFlexDirection) {
        switch rawValue {
        case YGFlexDirectionColumn:
            self = .column
        case YGFlexDirectionColumnReverse:
            self = .columnReverse
        case YGFlexDirectionRow:
            self = .row
        case YGFlexDirectionRowReverse:
            self = .rowReverse
        default:
            self = .count
        }
    }
    
    public var rawValue: YGFlexDirection {
        switch self {
        case .column:
            return YGFlexDirectionColumn
        case .columnReverse:
            return YGFlexDirectionColumnReverse
        case .row:
            return YGFlexDirectionRow
        case .rowReverse:
            return YGFlexDirectionRowReverse
        case .count:
            return YGFlexDirectionCount
        }
    }
}

public enum FBMeasureMode:Int,RawRepresentable,FlexboxConstantTarget {
    case undefined
    case exactly
    case atMost
    case count
    
    public init(rawValue: YGMeasureMode) {
        switch rawValue {
        case YGMeasureModeUndefined:
            self = .undefined
        case YGMeasureModeExactly:
            self = .exactly
        case YGMeasureModeAtMost:
            self = .atMost
        default:
            self = .count
        }
    }
    
    public var rawValue: YGMeasureMode {
        switch self {
        case .undefined:
            return YGMeasureModeUndefined
        case .exactly:
            return YGMeasureModeExactly
        case .atMost:
            return YGMeasureModeAtMost
        case .count:
            return YGMeasureModeCount
        }
    }
}

public enum FBPrintOptions:Int,RawRepresentable,FlexboxConstantTarget {
    case layout
    case style
    case children
    case count
    
    public init(rawValue: YGPrintOptions) {
        switch rawValue {
        case YGPrintOptionsLayout:
            self = .layout
        case YGPrintOptionsStyle:
            self = .style
        case YGPrintOptionsChildren:
            self = .children
        default:
            self = .count
        }
    }
    
    public var rawValue: YGPrintOptions {
        switch self {
        case .layout:
            return YGPrintOptionsLayout
        case .style:
            return YGPrintOptionsStyle
        case .children:
            return YGPrintOptionsChildren
        case .count:
            return YGPrintOptionsCount
        }
    }
}

public enum FBEdge:Int,RawRepresentable,FlexboxConstantTarget {
    case left
    case top
    case right
    case bottom
    case start
    case end
    case horizontal
    case vertical
    case all
    case count
    
    public init(rawValue: YGEdge) {
        switch rawValue {
        case YGEdgeLeft:
            self = .left
        case YGEdgeTop:
            self = .top
        case YGEdgeRight:
            self = .right
        case YGEdgeBottom:
            self = .bottom
        case YGEdgeStart:
            self = .start
        case YGEdgeEnd:
            self = .end
        case YGEdgeHorizontal:
            self = .horizontal
        case YGEdgeVertical:
            self = .vertical
        case YGEdgeAll:
            self = .all
        default:
            self = .count
        }
    }
    
    public var rawValue: YGEdge {
        switch self {
        case .left:
            return YGEdgeLeft
        case .top:
            return YGEdgeTop
        case .right:
            return YGEdgeRight
        case .bottom:
            return YGEdgeBottom
        case .start:
            return YGEdgeStart
        case .end:
            return YGEdgeEnd
        case .horizontal:
            return YGEdgeHorizontal
        case .vertical:
            return YGEdgeVertical
        case .all:
            return YGEdgeAll
        case .count:
            return YGEdgeCount
        }
    }
}

public enum FBPositionType:Int,RawRepresentable,FlexboxConstantTarget {
    case relative
    case absolute
    case count
    
    public init(rawValue: YGPositionType) {
        switch rawValue {
        case YGPositionTypeRelative:
            self = .relative
        case YGPositionTypeAbsolute:
            self = .absolute
        default:
            self = .count
        }
    }
    
    public var rawValue: YGPositionType {
        switch self {
        case .relative:
            return YGPositionTypeRelative
        case .absolute:
            return YGPositionTypeAbsolute
        case .count:
            return YGPositionTypeCount
        }
    }
}

public enum FBDimension:Int,RawRepresentable,FlexboxConstantTarget {
    case width
    case height
    case count
    
    public init(rawValue: YGDimension) {
        switch rawValue {
        case YGDimensionWidth:
            self = .width
        case YGDimensionHeight:
            self = .height
        default:
            self = .count
        }
    }
    
    public var rawValue: YGDimension {
        switch self {
        case .width:
            return YGDimensionWidth
        case .height:
            return YGDimensionHeight
        case .count:
            return YGDimensionCount
        }
    }
}

public enum FBJustify:Int,RawRepresentable,FlexboxConstantTarget {
    case flexStart
    case center
    case flexEnd
    case spaceBetween
    case spaceAround
    case count
    
    public init(rawValue: YGJustify) {
        switch rawValue {
        case YGJustifyFlexStart:
            self = .flexStart
        case YGJustifyCenter:
            self = .center
        case YGJustifyFlexEnd:
            self = .flexEnd
        case YGJustifySpaceBetween:
            self = .spaceBetween
        case YGJustifySpaceAround:
            self = .spaceAround
        default:
            self = .count
        }
    }
    
    public var rawValue: YGJustify {
        switch self {
        case .flexStart:
            return YGJustifyFlexStart
        case .center:
            return YGJustifyCenter
        case .flexEnd:
            return YGJustifyFlexEnd
        case .spaceBetween:
            return YGJustifySpaceBetween
        case .spaceAround:
            return YGJustifySpaceAround
        case .count:
            return YGJustifyCount
        }
    }
}

public enum FBDirection:Int,RawRepresentable,FlexboxConstantTarget {
    case inherit
    case lTR
    case rTL
    case count
    
    public init(rawValue: YGDirection) {
        switch rawValue {
        case YGDirectionInherit:
            self = .inherit
        case YGDirectionLTR:
            self = .lTR
        case YGDirectionRTL:
            self = .rTL
        default:
            self = .count
        }
    }
    
    public var rawValue: YGDirection {
        switch self {
        case .inherit:
            return YGDirectionInherit
        case .lTR:
            return YGDirectionLTR
        case .rTL:
            return YGDirectionRTL
        case .count:
            return YGDirectionCount
        }
    }
}

public enum FBLogLevel:Int,RawRepresentable,FlexboxConstantTarget {
    case error
    case warn
    case info
    case debug
    case verbose
    case count
    
    public init(rawValue: YGLogLevel) {
        switch rawValue {
        case YGLogLevelError:
            self = .error
        case YGLogLevelWarn:
            self = .warn
        case YGLogLevelInfo:
            self = .info
        case YGLogLevelDebug:
            self = .debug
        case YGLogLevelVerbose:
            self = .verbose
        default:
            self = .count
        }
    }
    
    public var rawValue: YGLogLevel {
        switch self {
        case .error:
            return YGLogLevelError
        case .warn:
            return YGLogLevelWarn
        case .info:
            return YGLogLevelInfo
        case .debug:
            return YGLogLevelDebug
        case .verbose:
            return YGLogLevelVerbose
        case .count:
            return YGLogLevelCount
        }
    }
}

public enum FBWrap:Int,RawRepresentable,FlexboxConstantTarget {
    case noWrap
    case wrap
    case count
    
    public init(rawValue: YGWrap) {
        switch rawValue {
        case YGWrapNoWrap:
            self = .noWrap
        case YGWrapWrap:
            self = .wrap
        default:
            self = .count
        }
    }
    
    public var rawValue: YGWrap {
        switch self {
        case .noWrap:
            return YGWrapNoWrap
        case .wrap:
            return YGWrapWrap
        case .count:
            return YGWrapCount
        }
    }
}

public enum FBOverflow:Int,RawRepresentable,FlexboxConstantTarget {
    case visible
    case hidden
    case scroll
    case count
    
    public init(rawValue: YGOverflow) {
        switch rawValue {
        case YGOverflowVisible:
            self = .visible
        case YGOverflowHidden:
            self = .hidden
        case YGOverflowScroll:
            self = .scroll
        default:
            self = .count
        }
    }
    
    public var rawValue: YGOverflow {
        switch self {
        case .visible:
            return YGOverflowVisible
        case .hidden:
            return YGOverflowHidden
        case .scroll:
            return YGOverflowScroll
        case .count:
            return YGOverflowCount
        }
    }
}

public enum FBExperimentalFeature:Int,RawRepresentable,FlexboxConstantTarget {
    case rounding
    case webFlexBasis
    case count
    
    public init(rawValue: YGExperimentalFeature) {
        switch rawValue {
        case YGExperimentalFeatureRounding:
            self = .rounding
        case YGExperimentalFeatureWebFlexBasis:
            self = .webFlexBasis
        default:
            self = .count
        }
    }
    
    public var rawValue: YGExperimentalFeature {
        switch self {
        case .rounding:
            return YGExperimentalFeatureRounding
        case .webFlexBasis:
            return YGExperimentalFeatureWebFlexBasis
        case .count:
            return YGExperimentalFeatureCount
        }
    }
}

public enum FBAlign:Int,RawRepresentable,FlexboxConstantTarget {
    case auto
    case flexStart
    case center
    case flexEnd
    case stretch
    case count
    
    public init(rawValue: YGAlign) {
        switch rawValue {
        case YGAlignAuto:
            self = .auto
        case YGAlignFlexStart:
            self = .flexStart
        case YGAlignCenter:
            self = .center
        case YGAlignFlexEnd:
            self = .flexEnd
        case YGAlignStretch:
            self = .stretch
        default:
            self = .count
        }
    }
    
    public var rawValue: YGAlign {
        switch self {
        case .auto:
            return YGAlignAuto
        case .flexStart:
            return YGAlignFlexStart
        case .center:
            return YGAlignCenter
        case .flexEnd:
            return YGAlignFlexEnd
        case .stretch:
            return YGAlignStretch
        case .count:
            return YGAlignCount
        }
    }
}
