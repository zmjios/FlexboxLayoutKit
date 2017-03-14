//
//  FeedCell.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/10.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    public var titleLabel:UILabel
    public var contentLabel:UILabel
    public var contentImageView:UIImageView
    public var usernameLabel:UILabel
    public var timeLabel:UILabel

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        
        contentImageView = UIImageView()
        
        usernameLabel = UILabel()
        //usernameLabel.backgroundColor = UIColor.brown
        usernameLabel.numberOfLines = 0
        
        timeLabel = UILabel()
        //timeLabel.backgroundColor = UIColor.orange
        timeLabel.textAlignment = .right
        timeLabel.numberOfLines = 0
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(usernameLabel)
        self.contentView.addSubview(contentImageView)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutViews()
    }
    
    
    public func setEntity(model:FeedModel){
        
        titleLabel.text = model.title
        contentLabel.text = model.content
        contentImageView.image = (model.imageName?.characters.count)! > 0 ? UIImage.init(named: model.imageName!):nil
        usernameLabel.text = model.username
        timeLabel.text = model.time
        
        
        //layoutViews()
    }
    
    func layoutViews(){
        
        self.contentView.makeFlexbox{make in
            
            make.flexDirection.equalTo(FBFlexDirection.column)
            make.margin.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
            make.alignItems.equalTo(FBAlign.flexStart)
        }
        
        titleLabel.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(10, 10, 0, 0)).wrapContent()
        }
        
        contentLabel.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(10, 10, 0, 0)).wrapContent()
        }
        
        contentImageView.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(10, 10, 0, 0)).wrapContent()
        }
        
        usernameLabel.makeFlexbox{make in
            make.flexGrow.equalTo(1.0).wrapContent()
        }
        
        timeLabel.makeFlexbox{make in
            make.flexGrow.equalTo(1.0).wrapContent()
        }
        
        let div = FBLayoutDiv.layoutDiv(direction: FBFlexDirection.row, justify: FBJustify.spaceBetween, alignItems: FBAlign.flexStart, children: [usernameLabel,timeLabel])
        div.makeFlexbox{make in
            make.margin.equalTo(UIEdgeInsetsMake(10, 10, 0, 10))
        }
        
        self.contentView.fb_children = [titleLabel,contentLabel,contentImageView,div]
        self.contentView.fb_applyLayouSize(CGSize(width: UIScreen.main.bounds.size.width, height:YGGet_undefined()))
    }

}

