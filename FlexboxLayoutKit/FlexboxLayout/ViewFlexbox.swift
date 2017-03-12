//
//  ViewFlexbox.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/10.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import Foundation

private var uiview_fblayout_key = "fb_layout_key"
private var uiview_fblayout_children_key = "fblayout_children_key"


func bridge<T : AnyObject>(obj : T) -> UnsafeMutableRawPointer {
    return UnsafeMutableRawPointer(Unmanaged.passUnretained(obj).toOpaque())
}

func bridge<T : AnyObject>(ptr : UnsafeMutableRawPointer) -> T {
    return Unmanaged<T>.fromOpaque(ptr).takeUnretainedValue()
}

extension UIView:FlexboxLayoutProtocol{
    
    public var fb_layout: FBLayout{
        
        var layout:FBLayout? = objc_getAssociatedObject(self,&uiview_fblayout_key) as! FBLayout?
        if layout == nil{
            layout = FBLayout()
            layout!.context = self
            objc_setAssociatedObject(self, &uiview_fblayout_key, layout, .OBJC_ASSOCIATION_RETAIN)
        }
        
        return layout!
    }
    
    public var fb_children: [FlexboxLayoutProtocol]{
        get{
            var children = objc_getAssociatedObject(self, &uiview_fblayout_children_key)
            if children == nil{
                children = [FlexboxLayoutProtocol]()
                objc_setAssociatedObject(self, &uiview_fblayout_children_key, children, .OBJC_ASSOCIATION_RETAIN)
            }
            return children as! [FlexboxLayoutProtocol]
        }
        set{
            objc_setAssociatedObject(self, &uiview_fblayout_children_key, newValue, .OBJC_ASSOCIATION_RETAIN)
            fb_layout.removeAllChild()
            for child in newValue{
                fb_layout.addChild(layout: child.fb_layout)
            }
        }
    }
    
    // MARK: - collection
    
    public func fb_addChild(_ child: FlexboxLayoutProtocol) {
        var newChildren = fb_children
        newChildren.append(child)
        self.fb_children = newChildren
    }
    
    public func fb_addChildren(_ children: [FlexboxLayoutProtocol]) {
        var newChildren = fb_children
        newChildren.append(contentsOf: children)
        self.fb_children = newChildren
        
    }
    
    public func fb_insertChild(_ child: FlexboxLayoutProtocol, at index: Int) {
        var newChildren = fb_children
        newChildren.insert(child, at: index)
        self.fb_children = newChildren
        
    }
    
    public func fb_removeChild(_ child: FlexboxLayoutProtocol) {
        
        //todo: how to conform Equatable
    }
    
    public func fb_removeAllChild() {
        fb_children.removeAll()
        self.fb_children = []
    }
    
    
    // MARK: - layout
    public func fb_applyLayoutToViewHierachy() {
        
        for layoutItem in fb_children{
            
            layoutItem.frame = layoutItem.fb_layout.frame
            layoutItem.fb_applyLayoutToViewHierachy()
        }
    }
    
    public func fb_applyLayouSize(_ size: CGSize) {
        
        fb_layout.calculateLayout(size)
        self.frame = fb_layout.frame
        fb_applyLayoutToViewHierachy()
    }
    
    public func fb_asyApplyLayoutSize(_ size: CGSize) {
        
        //todo
        
    }
    
    public func fb_applyLayout(){
        //in most cases,the container have set width an height,we just layout subViews
        fb_applyLayouSize(self.bounds.size)
    }
    
    public func makeFlexbox(_ closure:(FBLayoutMaker) -> Void) {
        if let make = self.fb_layout.maker{
            
            if self.fb_children.count == 0{
                //first the container may be contain subviews,so must be include
                self.fb_children = self.subviews
            }
            
            closure(make)
        }
    }
    
    public func wrapContent(){
        
        // only leaf nodes should be have a measure function
        if self.fb_children.count == 0{
            
            //todo:how to use C fuction pointers in Swift3?
            
//            let measureFunc = { (node: YGNodeRef?, width: CFloat, widthMode: YGMeasureMode, height: CFloat, heightMode: YGMeasureMode) -> YGSize in
//                
//                let constrainedWidth = (widthMode == YGMeasureModeUndefined) ? CGFloat.greatestFiniteMagnitude : CGFloat(width);
//                let constrainedHeight = (heightMode == YGMeasureModeUndefined) ? CGFloat.greatestFiniteMagnitude : CGFloat(height);
//                
//                let size = CGSize(width: CGFloat(constrainedWidth), height: CGFloat(constrainedHeight))
//                let sizeThatFits = self.sizeThatFits(size)
//                
//                return YGSize(
//                    width: Float(YGSanitizeMeasurement(constrainedWidth, sizeThatFits.width, widthMode)),
//                    height: Float(YGSanitizeMeasurement(constrainedHeight, sizeThatFits.height, heightMode)))
//            }
            
            //let meaureFuncWrap = unsafeBitCast(measureFunc, to: YGMeasureFunc.self)
        
            FBNodeSetMeasureFunc(self.fb_layout.getNode())
        }
    }

}
