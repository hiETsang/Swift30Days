//
//  BackTableViewController.swift
//  Day23
//
//  Created by canoe on 2018/5/17.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

typealias selectRowBlock = (String) -> Void

class BackTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var selectRow : selectRowBlock?
    
    var tableView : UITableView!
    let dataArray = ["FriendRead","Article","ReadLater"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.007843137255, alpha: 1)
        
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = view.backgroundColor
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = tableView.backgroundColor
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectRow?(dataArray[indexPath.row])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
