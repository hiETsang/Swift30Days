//
//  MenuViewController.swift
//  Day16
//
//  Created by canoe on 2018/4/22.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView?
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem = "Everyday Moments"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        view.addSubview(self.tableView!)
        self.tableView?.separatorStyle = .none
        self.tableView?.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        self.tableView?.backgroundColor = .clear

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        cell.menuTitleLabel.text = menuItems[indexPath.row]
        cell.menuTitleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        return cell
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
