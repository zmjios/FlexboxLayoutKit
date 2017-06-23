//
//  SecondViewController.swift
//  FlexboxLayoutKit
//
//  Created by 曾明剑 on 2017/3/10.
//  Copyright © 2017年 曾明剑. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    fileprivate var feeds:[FeedModel]?
    fileprivate let _onceToken = NSUUID().uuidString

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.title = "flexboxdemo2"
        self.tableView.estimatedRowHeight = 300
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(FeedCell.self, forCellReuseIdentifier: "cellId")
        
        loadData {
            print("load success")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadData(complete: @escaping ()->Void){
        
        DispatchQueue.global().async {
            if let dataFilePath = Bundle.main.path(forResource: "data", ofType: "json"){
                
                do{
                    
                    let  data = try Data.init(contentsOf: URL.init(fileURLWithPath: dataFilePath))
                    let dic = try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.allowFragments])
                    
                    if let dic = dic as? Dictionary<String, Array<Dictionary<String,String>>>{
                        let feedDics = dic["feed"]! as Array<Dictionary<String,String>>
                        let feedList = feedDics.map{
                            subdic -> FeedModel in
                            FeedModel.init(dictionary: subdic)
                        }
                        self.feeds = feedList
                        
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
                complete()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        /*
        var cell:FeedCell?
        
        DispatchQueue.once(token: _onceToken) {
            cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! FeedCell?
        }
        if cell != nil{
            
            if let feeds = feeds{
                let model = feeds[indexPath.row]
                // 根据当前数据，计算Cell的高度，注意+1是contentview和cell之间的分割线高度
                model.cellHeight = Float(cell!.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + 1.0)
                
                return CGFloat(model.cellHeight);
            }
        }*/
        
        return 360

    }


    // MARK: - UITabelViewDelegate and DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feeds = feeds{
            return feeds.count
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedCell:FeedCell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! FeedCell
        
        if let feeds = feeds{
            let model = feeds[indexPath.row]
            feedCell.setEntity(model: model)
        }
        
        return feedCell
        
    }

}


extension DispatchQueue{
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform. or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
