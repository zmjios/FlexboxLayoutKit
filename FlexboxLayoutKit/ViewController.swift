//
//  ViewController.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/7.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
        let label = UILabel()
        label.text = "please see the demo in the FlexBox.PlayGround"
        label.numberOfLines = 0
        label.backgroundColor = UIColor.orange
        self.view.addSubview(label)
        label.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(80, 20, 0, 0))
            make.size.equalTo(CGSize(width: 300, height: 80)).wrapContent()
        }
        self.view.makeFlexbox{make in
            make.justifyContent.equalTo(FBJustify.center)
            make.alignItems.equalTo(FBAlign.center)
        }
        self.view.fb_applyLayout()
        
        self.title = "flexboxdemo1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

