//
//  FBLayout.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/7.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit


public class FBLayoutMaker:NSObject{
    
    public unowned var layout:FBLayout
    fileprivate var fbStyles:[String] = []
    
    //MARK: - propreties

    public var flexDirection:FBLayout{
        get{
            
            addStyle("FlexDirection")
            return self.layout
        }
        set{}
    }
    
    public var justifyContent:FBLayout{
        get{
            addStyle("JustifyContent")
            return self.layout
        }
    }
    
    public var alignContent:FBLayout{
        get{
            addStyle("AlignContent")
            return self.layout
        }
    }
    
    public var alignItems:FBLayout{
        get{
            addStyle("AlignItems")
            return self.layout
        }
    }
    public var alignSelf:FBLayout{
        get{
            addStyle("AlignSelf");
            return self.layout
        }
    }
    public var positionType:FBLayout{
        get{
            addStyle("PositionType")
            return self.layout
        }
    }
    
    public var flexWrap:FBLayout{
        get{
            addStyle("FlexWrap")
            return self.layout
        }
    }
    
    public var flexGrow:FBLayout{
        get{
            addStyle("FlexGrow")
            return self.layout
        }
    }
    
    public var flexShrink:FBLayout{
        get{
            addStyle("FlexShrink")
            return self.layout
        }
    }
    public var flexBasics:FBLayoutMaker{
        get{
            addStyle("FlexBasics")
            return self
        }
    }
    public var position:FBLayout{
        get{
            addStyle("Position")
            return self.layout
        }
    }
    
    public var margin:FBLayout{
        get{
            addStyle("Margin")
            return self.layout
        }
    }
    
    public var padding:FBLayout{
        get{
            addStyle("Padding")
            return self.layout
        }
    }
    
    public var width:FBLayout{
        get{
            addStyle("Width")
            return self.layout
        }
    }
    
    public var height:FBLayout{
        get{
            addStyle("Height")
            return self.layout
        }
    }
    
    public var minWidth:FBLayout{
        get{
            addStyle("MinWidth")
            return self.layout
        }
    }
    
    public var minHeight:FBLayout{
        get{
            addStyle("MinHeight")
            return self.layout
        }
    }
    
    public var maxWidth:FBLayout{
        get{
            addStyle("MaxWidth")
            return self.layout
        }
    }
    
    public var maxHeight:FBLayout{
        get{
            addStyle("MaxHeight")
            return self.layout
        }
    }
    
    public var size:FBLayout{
        get{
            addStyle("Size")
            return self.layout
        }
    }
    
    
    public var minSize:FBLayout{
        get{
            addStyle("MinSize")
            return self.layout
        }
    }
    
    public var aspectRatio:FBLayout{
        get{
            addStyle("AspectRatio")
            return self.layout
        }
    }
    
    public init(_ fb_layout:FBLayout = FBLayout()){
        
        layout = fb_layout
        super.init()
        self.layout.maker = self
        
    }
    
    
    fileprivate func addStyle(_ style:String){
        if !fbStyles.contains(style) {
            fbStyles.append(style)
        }
    }

}

public final class FBLayout:NSObject {
    
    fileprivate var node:YGNodeRef
    fileprivate var childs:Array<FBLayout>
    fileprivate var parent:FBLayout?
    public var maker:FBLayoutMaker?
    
    public var context:AnyObject?{
        didSet{
            YGNodeSetContext(node, bridge(obj: self.context as AnyObject))
        }
    }

    public var frame:CGRect{
        
        return CGRect(x:YGRoundPixelValue(CGFloat(YGNodeLayoutGetLeft(node))),
                      y:YGRoundPixelValue(CGFloat(YGNodeLayoutGetTop(node))),
                      width:YGRoundPixelValue(CGFloat(YGNodeLayoutGetWidth(node))),
                      height:YGRoundPixelValue(CGFloat(YGNodeLayoutGetHeight(node))))
    }
    
    public override init(){
        
        node = YGNodeNew()
        childs = [FBLayout]()
        
        super.init()
        
        maker = FBLayoutMaker(self)
    }
    
    deinit{
        YGNodeFree(node)
    }
    
    // Mark: public function
    
    public func getChild(at index:Int)->FBLayout?{
        if index < childs.count{
            return childs[index]
        }
        
        return nil;
    }
    
    public func addChild(layout:FBLayout){
        
        childs.append(layout)
        layout.parent = self
        YGNodeInsertChild(node, layout.node, YGNodeGetChildCount(node))
    }
    
    public func addChildren(layouts:[FBLayout]){
        for layout in layouts {
            addChild(layout: layout)
        }
    }
    
    public func insertChild(layout:FBLayout,at index:Int){
        
        childs.insert(layout, at: index)
        layout.parent = self
        YGNodeInsertChild(node, layout.node, UInt32(index))
    }
    
    public func removeChild(layout:FBLayout){
        
        var index:Int?
        for i in 0..<childs.count{
            if childs[i] == layout {
                index = i
                break
            }
        }
        if index != nil{
            childs.remove(at: index!)
            YGNodeRemoveChild(node, layout.node)
        }
    }
    
    public func removeAllChild(){
        childs.removeAll()
        
        while YGNodeGetChildCount(node) > 0 {
            YGNodeRemoveChild(node, YGNodeGetChild(node, YGNodeGetChildCount(node) - 1))
        }
    }
    
    public func calculateLayout(_ size:CGSize){
        
        YGNodeCalculateLayout(node, Float(size.width), Float(size.height), YGNodeLayoutGetDirection(node))
    }
    
    
    public func wrapContent(){
        if let _ = self.context as? UIView{
            if self.childs.count == 0{
                FBNodeSetMeasureFunc(node)
                return
            }
        }
        
        
        YGNodeSetMeasureFunc(node, nil)
    }
    
    public func getNode()->YGNodeRef{
        return node
    }
    
    // Mark: Equatable
    public static func ==(lhs:FBLayout,rhs:FBLayout) -> Bool{
        
        if lhs.node == rhs.node && lhs.childs == rhs.childs{
            
            return true
        }
        
        return false
        
    }
}

extension FBLayout{
    
    public func setDirection(_ direction:FBDirection){
        
        YGNodeStyleSetDirection(node, direction.rawValue)
    }
    
    public func setFlexDirection(_ flexDirection:FBFlexDirection){
        YGNodeStyleSetFlexDirection(node, flexDirection.rawValue)
    }
    
    public func setJustifyContent(_ justifyContent:FBJustify){
        YGNodeStyleSetJustifyContent(node, justifyContent.rawValue)
    }
    
    public func setAlignContent(_ align:FBAlign){
        YGNodeStyleSetAlignContent(node, align.rawValue)
    }
    
    public func setAlignItems(_ alignItems:FBAlign){
        YGNodeStyleSetAlignItems(node, alignItems.rawValue)
    }
    
    public func setAlignSelf(_ alignSelf:FBAlign){
        YGNodeStyleSetAlignSelf(node, alignSelf.rawValue)
    }
    
    public func setPositionType(_ positionType:FBPositionType){
        YGNodeStyleSetPositionType(node, positionType.rawValue)
    }
    
    public func setFlexWrap(_ flexWrap:FBWrap){
        YGNodeStyleSetFlexWrap(node, flexWrap.rawValue)
    }
    
    public func setFlexGrow(_ flexGrow:Float){
        YGNodeStyleSetFlexGrow(node, flexGrow)
    }
    
    public func setFlexShrink(_ flexShrink:Float){
        YGNodeStyleSetFlexShrink(node, flexShrink)
    }
    
    public func setFlexBasics(_ flexBasics:Float){
        YGNodeStyleSetFlexBasis(node, flexBasics)
    }
    
    public func setWidth(_ width:Float){
        YGNodeStyleSetWidth(node, width)
    }
    
    public func setHeight(_ height:Float){
        YGNodeStyleSetHeight(node, height)
    }
    
    public func setSize(_ size:CGSize){
        YGNodeStyleSetWidth(node, Float(size.width))
        YGNodeStyleSetHeight(node, Float(size.height))
    }
    
    public func setMinWidth(_ minWidth:Float){
        YGNodeStyleSetMinWidth(node, minWidth)
    }
    
    public func setMaxWidth(_ maxWidth:Float){
        
        YGNodeStyleSetMaxWidth(node, maxWidth)
    }
    
    public func setMinHeight(_ minHeight:Float){
        YGNodeStyleSetMinHeight(node, minHeight)
    }
    
    public func setMaxHeight(_ maxHeight:Float){
        YGNodeStyleSetMaxHeight(node, maxHeight)
    }
    
    public func setMinSize(_ minSize:CGSize){
        
        YGNodeStyleSetMinWidth(node, Float(minSize.width))
        YGNodeStyleSetMinHeight(node, Float(minSize.height))
    }
    
    public func setMaxSize(_ maxSize:CGSize){
        
        YGNodeStyleSetMaxWidth(node, Float(maxSize.width))
        YGNodeStyleSetMaxHeight(node, Float(maxSize.height))
    }
    
    public func setMargin(_ margin:UIEdgeInsets){
        YGNodeStyleSetMargin(node, YGEdgeLeft, Float(margin.left))
        YGNodeStyleSetMargin(node, YGEdgeTop, Float(margin.top))
        YGNodeStyleSetMargin(node, YGEdgeRight, Float(margin.right))
        YGNodeStyleSetMargin(node, YGEdgeBottom, Float(margin.bottom))
    }
    
    public func setPadding(_ padding:UIEdgeInsets){
        YGNodeStyleSetPadding(node, YGEdgeLeft, Float(padding.left))
        YGNodeStyleSetPadding(node, YGEdgeTop, Float(padding.top))
        YGNodeStyleSetPadding(node, YGEdgeRight, Float(padding.right))
        YGNodeStyleSetPadding(node, YGEdgeBottom, Float(padding.bottom))
    }
    
    public func setPosition(_ position:UIEdgeInsets){
        YGNodeStyleSetPosition(node, YGEdgeLeft, Float(position.left))
        YGNodeStyleSetPosition(node, YGEdgeTop, Float(position.top))
        YGNodeStyleSetPosition(node, YGEdgeRight, Float(position.right))
        YGNodeStyleSetPosition(node, YGEdgeBottom, Float(position.bottom))
    }
    
    public func setAspectRatio(_ aspectRatio:Float){
        YGNodeStyleSetAspectRatio(node, aspectRatio)
    }

    
}

extension FBLayout{
    
    @discardableResult
    public func equalTo(_ attr:FlexboxConstantTarget) ->FBLayout{
        
        if let view = attr as? FlexboxLayoutProtocol{
            YGNodeCopyStyle(node, view.fb_layout.node)
        }
        else if let size = attr as? CGSize,let make = self.maker {
            
            if make.fbStyles.contains("Size"){
                setSize(size)
            }
            if make.fbStyles.contains("MinSize"){
                setMinSize(size)
            }
            if make.fbStyles.contains("MaxSize"){
                setMaxSize(size)
            }
        }
        else if let edgeInsets = attr as? UIEdgeInsets,let make = self.maker{
            
            if make.fbStyles.contains("Margin"){
                setMargin(edgeInsets)
            }
            if make.fbStyles.contains("Padding"){
                setPadding(edgeInsets)
            }
            if make.fbStyles.contains("Position"){
                setPosition(edgeInsets)
            }
        }
        else if let make = self.maker{
            //CGFloat Float Int etc type
            
            var flexFloat:Float = Float(0)
            if  let value = (attr as? Float) {
                flexFloat = value
            }
            else if let value = (attr as? Double){
                flexFloat = Float(value)
            }
            else if let value = (attr as? Int){
                flexFloat = Float(value)
            }
            
            if make.fbStyles.contains("FlexDirection"){
                
                if let flexDirection = attr as? FBFlexDirection{
                    setFlexDirection(flexDirection)
                }
            }
            if make.fbStyles.contains("JustifyContent"){
                if let justify = attr as? FBJustify{
                     setJustifyContent(justify)
                }
            }
            if make.fbStyles.contains("AlignContent"){
                
                if let align = attr as? FBAlign{
                    setAlignContent(align)
                }
            }
            if make.fbStyles.contains("AlignItems"){
            
                if let align = attr as? FBAlign{
                    setAlignItems(align)
                }
            }
            if make.fbStyles.contains("AlignSelf"){
                if let align = attr as? FBAlign{
                    setAlignSelf(align)
                }
            }
            if make.fbStyles.contains("PositionType"){
                if let positionType = attr as? FBPositionType{
                    setPositionType(positionType)
                }
            }
            if make.fbStyles.contains("FlexWrap"){
                if let flexWrap = attr as? FBWrap{
                    setFlexWrap(flexWrap)
                }
            }
            if make.fbStyles.contains("FlexGrow"){
                setFlexGrow(flexFloat)
            }
            if make.fbStyles.contains("FlexShrink"){
                setFlexShrink(flexFloat)
            }
            if make.fbStyles.contains("FlexBasics"){
                setFlexBasics(flexFloat)
            }
            if make.fbStyles.contains("Width"){
                setWidth(flexFloat)
            }
            if make.fbStyles.contains("Height"){
                setHeight(flexFloat)
            }
            if make.fbStyles.contains("MinWidth"){
                setMinWidth(flexFloat)
            }
            if make.fbStyles.contains("MinHeight"){
                setMinHeight(flexFloat)
            }
            if make.fbStyles.contains("MaxWidth"){
                setMaxWidth(flexFloat)
            }
            if make.fbStyles.contains("MaxHeight"){
                setMaxHeight(flexFloat)
            }
            if make.fbStyles.contains("AspectRatio"){
                setAspectRatio(flexFloat)
            }
        }
        
        maker?.fbStyles.removeAll()
        
        return self
    }
}

