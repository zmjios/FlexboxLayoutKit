//
//  FBLayoutDiv.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/9.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import Foundation

@objc public final class FBLayoutDiv:NSObject,FlexboxLayoutProtocol{
    
    public var fb_layout: FBLayout
    public var frame: CGRect = CGRect.zero
    public var fb_children: [FlexboxLayoutProtocol] = []
    
    override public var description: String {
        return "<FBLayoutDiv: \(self);frame = \(frame) \n fb_layout= \(fb_layout) \n fb_children= \(fb_children)>"
    }
    
    override public var debugDescription: String {
        return "<FBLayoutDiv: \(self);frame = \(frame) \n fb_layout= \(fb_layout) \n fb_children= \(fb_children)>"
    }
    
    public static func layoutDiv(direction:FBFlexDirection = .row,
                                 justify:FBJustify = .flexStart,
                                 alignItems:FBAlign = .auto,
                                 children:[FlexboxLayoutProtocol] = [FlexboxLayoutProtocol]()) -> FBLayoutDiv{
        
        let div = FBLayoutDiv()
        
        div.makeFlexbox{make in
            make.layout.setFlexDirection(direction)
            make.layout.setJustifyContent(justify)
            make.layout.setAlignItems(alignItems)
        }
        
        div.setFb_Children(children)
    
        return div
    }
    
    public override init(){
        
        fb_layout = FBLayout()
        super.init()
        fb_layout.context = self
    }
    
    
    public func setFb_Children(_ children:[FlexboxLayoutProtocol]){
        
        self.fb_children.removeAll()
        self.fb_children.append(contentsOf: children)
        
        self.fb_layout.removeAllChild()
        for layoutItem in fb_children{
            
            //in this case,the child may be have addSubview in ContainerView,so we must remove parent
            YGNodeResetParent(layoutItem.fb_layout.getNode())
            self.fb_layout.addChild(layout: layoutItem.fb_layout)
        }
    }
    
     // MARK: - collection
    
    public func fb_addChild(_ child: FlexboxLayoutProtocol) {
        
        var newChildren = fb_children
        newChildren.append(child)
        setFb_Children(newChildren)
    }
    
    public func fb_addChildren(_ children: [FlexboxLayoutProtocol]) {
        var newChildren = fb_children
        newChildren.append(contentsOf: children)
        setFb_Children(newChildren)
    }
    
    public func fb_insertChild(_ child: FlexboxLayoutProtocol, at index: Int) {
        var newChildren = fb_children
        newChildren.insert(child, at: index)
        setFb_Children(newChildren)
    }
    
    public func fb_removeChild(_ child: FlexboxLayoutProtocol) {
        
        //todo: how to conform Equatable
        var newChildren = fb_children
        var index:Int?
        for i in 0..<newChildren.count{
            if child is NSObject && newChildren[i] is NSObject{
                if child as! NSObject == newChildren[i] as! NSObject {
                    index = i
                    break;
                }
            }
        }
        if index != nil{
            newChildren.remove(at: index!)
        }
        setFb_Children(newChildren)
    }
    
    public func fb_removeAllChild() {
        setFb_Children([])
    }
    

     // MARK: - layout
    public func fb_applyLayoutToViewHierachy() {
        
        for layoutItem in fb_children{
            
            layoutItem.frame = CGRect(x:self.frame.minX + layoutItem.fb_layout.frame.minX,
                                      y:self.frame.minY + layoutItem.fb_layout.frame.minY,
                                      width:layoutItem.fb_layout.frame.size.width,
                                      height:layoutItem.fb_layout.frame.size.height)
            layoutItem.fb_applyLayoutToViewHierachy()
        }
    }
    
    public func fb_applyLayouSize(_ size: CGSize) {
        
       fb_layout.calculateLayout(size)
       frame = fb_layout.frame
       fb_applyLayoutToViewHierachy()
    }
    
    public func fb_asyApplyLayoutSize(_ size: CGSize) {
        
    }
    
    public func makeFlexbox(_ closure:(FBLayoutMaker) -> Void) {
        
        if let make = self.fb_layout.maker{
            closure(make)
        }
    }
    
    
    
    

}
