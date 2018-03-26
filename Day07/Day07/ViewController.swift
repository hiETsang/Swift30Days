//
//  ViewController.swift
//  Day07
//
//  Created by canoe on 2018/3/24.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView!
    var dataArray:Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 60, width: view.frame.size.width, height: view.frame.size.height - 60), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        dataArray = Array.init(repeating: "111", count: 20)
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        tableView.dg_addPullToRefreshWithActionHandler({
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self.tableView.dg_stopLoading()
                self.dataArray.insert(contentsOf: ["0","0","0"], at: 0)
                self.tableView.reloadData()
            })
        }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(#colorLiteral(red: 0.515927732, green: 0.5158028603, blue: 1, alpha: 1))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

