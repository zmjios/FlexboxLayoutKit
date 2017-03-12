//
//  FeedModel.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/10.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit

class FeedModel: NSObject {
    
    static var counter = 0
    
    public var identifier:String{
        get{
            FeedModel.counter = FeedModel.counter +  1
            return String(format: "%d", FeedModel.counter)
        }
    }
    
    public var title:String?
    public var content:String?
    public var username:String?
    public var time:String?
    public var imageName:String?
    
    public var cellHeight:Float = 0
    
    
    init(dictionary:Dictionary<String, String>){
        
        super.init()
        
        title = dictionary["title"]
        content = dictionary["content"]
        username = dictionary["username"]
        time = dictionary["time"]
        imageName = dictionary["imageName"]
        
        
    }
    

}
