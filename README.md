
# FlexLayoutKit
This Project is Swift Wrapper of [facebook/yoga](https://github.com/facebook/yoga) and Inspired by [FlexBoxLayout](https://github.com/LPD-iOS/FlexBoxLayout)

# Example

```
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
```

