//
//  ViewController.swift
//  Day2
//
//  Created by canoe on 2017/8/29.
//  Copyright © 2017年 canoe. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var changeButton:UIButton?
    var tableView:UITableView?
    let textArray = ["哈哈哈哈哈哈哈哈","the second line","😁开心","1111112222222","i like code"]
    let fontNames = ["Gaspar Regular","MFJinHei_Noncommercial-Regular","MFTongXin_Noncommercial-Regular","MFZhiHei_Noncommercial-Regular"]
    var fontName:String = "Gaspar Regular"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.configUI()
    }
    
    func configUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 20, width: self.view.frame.size.width, height: self.view.frame.size.height - 20), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
        
        self.changeButton = UIButton(type:UIButtonType.custom)
        self.changeButton?.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        self.changeButton?.center = CGPoint.init(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height - 100)
        self.changeButton?.setTitle("转换", for: .normal)
        self.view.addSubview(self.changeButton!)
        self.changeButton?.backgroundColor = UIColor.yellow
        self.changeButton?.layer.cornerRadius = 25
        self.changeButton?.clipsToBounds = true
        self.changeButton?.addTarget(self, action: #selector(changeButtonClick(button:)), for: .touchUpInside)
    }
    
    @objc func changeButtonClick(button:UIButton) {
        
        self.fontName = self.fontNames[(self.fontNames.index(of: self.fontName)! + 1) % 4]
        print(self.fontName)
        self.tableView?.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.textArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: self.fontName, size: 16.0)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

