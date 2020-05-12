//
//  ViewController.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/7.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var contentView2:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 44))
        self.view.addSubview(scrollView)
    
        //center
        let contentView1 = UIView()
        scrollView.addSubview(contentView1)
        contentView1.backgroundColor = UIColor.brown
        let label = UILabel()
        label.text = "please see the demo in the FlexBoxPlayground"
        label.numberOfLines = 0
        label.backgroundColor = UIColor.orange
        contentView1.addSubview(label)
        label.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 0))
            make.size.equalTo(CGSize(width: 300, height: 80)).wrapContent()
        }
        contentView1.makeFlexbox{make in
            make.justifyContent.equalTo(FBJustify.center)
            make.alignItems.equalTo(FBAlign.center)
            make.size.equalTo(CGSize(width: self.view.bounds.size.width, height: 160))
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
        contentView2 = UIView()
        if let contentView2 = contentView2 {
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
                make.margin.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
                make.size.equalTo(CGSize(width: self.view.bounds.size.width-20, height: YGGet_undefined()))
            }
            //contentView2.fb_children = [child1,child2,child3,child4,child5,child6,child7,child8,child9,child10,child11,child12,div1]
            contentView2.fb_applyLayout()
            scrollView.addSubview(contentView2)
        }
        
        let seg = UISegmentedControl(items: ["jyFlexStart","jySpaceBetween","aIcenter","fDRow"])
        seg.addTarget(self, action: #selector(switchSegAction(seg:)), for: [UIControl.Event.valueChanged])
        seg.makeFlexbox{
            make in
            make.size.equalTo(CGSize(width: self.view.bounds.size.width, height: 44))
        }
        scrollView.addSubview(seg)
        
        
        let child15 = gennerateView(color: UIColor.red)
        let child16 = gennerateView(color: UIColor.black)
        child16.makeFlexbox{make in
            make.alignSelf.equalTo(FBAlign.center)
        }
        let child17 = UIView()
        child17.backgroundColor = UIColor.blue
        child17.layer.cornerRadius = 10
        child17.makeFlexbox{make in
            make.size.equalTo(child15)
            make.alignSelf.equalTo(FBAlign.flexEnd)
        }
        let contentView3 = UIView()
        contentView3.layer.cornerRadius = 5.0
        contentView3.layer.borderColor = UIColor.black.cgColor
        contentView3.layer.borderWidth = 1.0
        contentView3.layer.masksToBounds = true
        contentView3.addSubview(child15)
        contentView3.addSubview(child16)
        contentView3.addSubview(child17)
        contentView3.makeFlexbox{make in
            make.size.equalTo(CGSize(width: 120, height: 120))
            make.margin.equalTo(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            make.flexDirection.equalTo(FBFlexDirection.column)
            make.justifyContent.equalTo(FBJustify.spaceAround)
        }
        scrollView.addSubview(contentView3)
        
        
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
            make.margin.equalTo(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            make.padding.equalTo(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)).wrapContent()
        }
        
        return label;
    }
    
    
    private func gennerateView(color:UIColor)->UIView{
        
        let label = UIView()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10.0
        label.backgroundColor = color
        label.makeFlexbox{make in
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        return label
    }
    
    @objc private func switchSegAction(seg:UISegmentedControl){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            switch seg.selectedSegmentIndex {
                
            case 0:
                self.contentView2!.makeFlexbox{
                    make in
                    make.flexDirection.equalTo(FBFlexDirection.row)
                    make.flexWrap.equalTo(FBWrap.wrap)
                    make.justifyContent.equalTo(FBJustify.flexStart)
                    make.alignContent.equalTo(FBAlign.center)
                    make.alignItems.equalTo(FBAlign.flexStart)
                    make.margin.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
                    make.size.equalTo(CGSize(width: self.view.bounds.size.width-20, height: YGGet_undefined()))
                }
            case 1:
                self.contentView2!.makeFlexbox{
                    make in
                    make.flexDirection.equalTo(FBFlexDirection.row)
                    make.flexWrap.equalTo(FBWrap.wrap)
                    make.justifyContent.equalTo(FBJustify.spaceBetween)
                    make.alignContent.equalTo(FBAlign.center)
                    make.alignItems.equalTo(FBAlign.flexStart)
                    make.margin.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
                    make.size.equalTo(CGSize(width: self.view.bounds.size.width-20, height: YGGet_undefined()))
                }
            case 2:
                self.contentView2!.makeFlexbox{
                    make in
                    make.flexDirection.equalTo(FBFlexDirection.row)
                    make.flexWrap.equalTo(FBWrap.wrap)
                    make.justifyContent.equalTo(FBJustify.flexStart)
                    make.alignContent.equalTo(FBAlign.center)
                    make.alignItems.equalTo(FBAlign.center)
                    make.margin.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
                    make.size.equalTo(CGSize(width: self.view.bounds.size.width-20, height: YGGet_undefined()))
                }
            case 3:
                self.contentView2!.makeFlexbox{
                    make in
                    make.flexDirection.equalTo(FBFlexDirection.column)
                    make.flexWrap.equalTo(FBWrap.noWrap)
                    make.justifyContent.equalTo(FBJustify.flexStart)
                    make.alignContent.equalTo(FBAlign.flexStart)
                    make.alignItems.equalTo(FBAlign.flexStart)
                    make.margin.equalTo(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
                    make.size.equalTo(CGSize(width: self.view.bounds.size.width-20, height: YGGet_undefined()))
                }
            default: break
            }
            
            self.contentView2!.superview!.fb_applyLayout()

        })
        
        
    }
    

}

