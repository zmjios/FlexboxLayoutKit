//
//  FlexboxLayoutProtocol.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/7.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import Foundation

@objc public protocol FlexboxLayoutProtocol{
    
    // the UIView or The FBLayoutDiv associate's layout
    var fb_layout:FBLayout{get}
    
    // the frame after calculates the layout
    var frame:CGRect{get set}
    
    var fb_children:[FlexboxLayoutProtocol]{get set}
    
    //MARK: - collection
    
    func fb_addChild(_ child:FlexboxLayoutProtocol)
    
    func fb_addChildren(_ children:[FlexboxLayoutProtocol])
    
    func fb_insertChild(_ child:FlexboxLayoutProtocol, at index:Int)
    
    func fb_removeChild(_ child:FlexboxLayoutProtocol)
    
    func fb_removeAllChild()
    
    // MARK: - layout
    
    func fb_applyLayoutToViewHierachy()
    
    func fb_applyLayouSize(_ size:CGSize)
    
    func fb_asyApplyLayoutSize(_ size:CGSize)
    
    func makeFlexbox(_ closure:(_ make:FBLayoutMaker)-> Void)
}


public protocol FlexboxConstantTarget{
    
}

extension Int:FlexboxConstantTarget{}

extension UInt:FlexboxConstantTarget{}

extension Float:FlexboxConstantTarget{}

extension CGFloat:FlexboxConstantTarget{}

extension Double:FlexboxConstantTarget{}

extension CGSize:FlexboxConstantTarget{}

extension CGPoint:FlexboxConstantTarget{}

extension UIEdgeInsets:FlexboxConstantTarget{}

extension UIView:FlexboxConstantTarget{}

//extension CGRect:FlexboxConstantTarget{}




