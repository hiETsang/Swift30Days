//
//  ViewController.swift
//  Day19
//
<<<<<<< HEAD
//  Created by canoe on 2018/4/27.
=======
//  Created by canoe on 2018/5/3.
>>>>>>> 7fc54bac068f7e021e11f3f521fa99b072a39e67
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
=======
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView?
    var dataArray = ["😂","😄","🐶","😢","❤️"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 20, width: kScreenWidth, height: kScreenHeight - 20), style:.plain)
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.backgroundColor = UIColor.white
        
        tableView?.mj_header = XDIYHeader.init(refreshingBlock: {
            //动画
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _  in
                self.tableView?.mj_header.endRefreshing()
            })
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        return cell
>>>>>>> 7fc54bac068f7e021e11f3f521fa99b072a39e67
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

<<<<<<< HEAD

=======
>>>>>>> 7fc54bac068f7e021e11f3f521fa99b072a39e67
}

