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
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView)
    
        //center
        let contentView1 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 200))
        scrollView.addSubview(contentView1)
        contentView1.backgroundColor = UIColor.brown
        let label = UILabel()
        label.text = "please see the demo in the FlexBoxPlayGround"
        label.numberOfLines = 0
        label.backgroundColor = UIColor.orange
        contentView1.addSubview(label)
        label.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(40, 20, 0, 0))
            make.size.equalTo(CGSize(width: 300, height: 80)).wrapContent()
        }
        contentView1.makeFlexbox{make in
            make.justifyContent.equalTo(FBJustify.center)
            make.alignItems.equalTo(FBAlign.center)
        }
        contentView1.fb_applyLayout()
        
        //标签
        let child1 = gennerateLabel(text: "我们")
        let child2 = gennerateLabel(text: "简直逆天了啊啊")
        let child3 = gennerateLabel(text: "23333333333")
        let child4 = gennerateLabel(text: "🤣🍅🍥")
        let child5 = gennerateLabel(text: "🤣🍅🍥🍇🌽🌶🥓🍋")
        let child6 = gennerateLabel(text: "这是标签1")
        let child7 = gennerateLabel(text: "🍥这是标签2")
        let child8 = gennerateLabel(text: "💧🍅🍥呵呵哈哈")
        let child9 = gennerateLabel(text: "💦🍥")
        let child10 = gennerateLabel(text: "🤣不能这么晚🍅🍥")
        let child11 = gennerateLabel(text: "🌧what the fuck🍅🍥")
        let child12 = gennerateLabel(text: "🍥")
        let child13 = gennerateLabel(text: "This works but the boilerplate code to declare the type of the squares array and then loop over it is a little verbose.")
        let child14 = gennerateLabel(text: "The shorthand closure syntax can make this hard to follow at first.")
        child13.makeFlexbox{
            make in
            make.flexShrink.equalTo(1.0)
        }
        child14.makeFlexbox{
            make in
            make.flexShrink.equalTo(1.0)
        }
        let div1 = FBLayoutDiv.layoutDiv(direction: FBFlexDirection.row, justify: FBJustify.flexStart, alignItems: FBAlign.flexStart, children: [child13,child14])
        let contentView2 = UIView()
        contentView2.addSubview(child1)
        contentView2.addSubview(child2)
        contentView2.addSubview(child3)
        contentView2.addSubview(child4)
        contentView2.addSubview(child5)
        contentView2.addSubview(child6)
        contentView2.addSubview(child7)
        contentView2.addSubview(child8)
        contentView2.addSubview(child9)
        contentView2.addSubview(child10)
        contentView2.addSubview(child11)
        contentView2.addSubview(child12)
        contentView2.addSubview(child13)
        contentView2.addSubview(child14)
        contentView2.fb_addChild(div1)
        contentView2.makeFlexbox{
            make in
            make.flexDirection.equalTo(FBFlexDirection.row)
            make.flexWrap.equalTo(FBWrap.wrap)
            make.justifyContent.equalTo(FBJustify.flexStart)
            make.alignContent.equalTo(FBAlign.center)
            make.alignItems.equalTo(FBAlign.flexStart)
            make.margin.equalTo(UIEdgeInsetsMake(0, 10, 0, 10))
            make.size.equalTo(CGSize(width: self.view.bounds.size.width, height: 400))
        }
        //contentView2.fb_children = [child1,child2,child3,child4,child5,child6,child7,child8,child9,child10,child11,child12,div1]
        contentView2.fb_applyLayout()
        scrollView.addSubview(contentView2)
        
        scrollView.makeFlexbox{
            make in
            make.flexDirection.equalTo(FBFlexDirection.column)
            make.justifyContent.equalTo(FBJustify.flexStart)
        }
        scrollView.fb_applyLayout()
        
        
        
        self.title = "flexboxdemo1"
    }


    private func gennerateLabel(text:String) -> UILabel{
        
        let label = UILabel()
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        label.backgroundColor = UIColor.cyan
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.makeFlexbox{
            make in
            make.margin.equalTo(UIEdgeInsetsMake(5, 5, 5, 5)).wrapContent()
            //make.padding.equalTo(UIEdgeInsetsMake(2, 3, 2, 3)).wrapContent()
        }
        
        return label;
    }


}

