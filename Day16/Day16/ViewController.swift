//
//  ViewController.swift
//  Day16
//
//  Created by canoe on 2018/4/17.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MenuViewControllerDelegate {
    
    let menuTransitionManager = MenuTransitionManager()
    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        
        self.title = "Everday Moments"
        let leftBarItem = UIBarButtonItem.init(title: "🍔", style: .plain, target: self, action: #selector(leftButtonClick))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        view.addSubview(self.tableView!)
        self.tableView?.separatorStyle = .none
        self.tableView?.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView?.backgroundColor = .clear
        
        
    }
    
    @objc func leftButtonClick()  {
        let viewController = MenuViewController()
        viewController.currentItem = self.title!
        viewController.delegate = self
        viewController.vc = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 237.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell
        
        cell?.backgroundColor = UIColor.clear
        if indexPath.row == 0 {
            cell?.mainImageView?.image = #imageLiteral(resourceName: "1")
            cell?.mainLabel?.text = "Love mountain."
            cell?.descLabel?.text = "Allen Wang"
            cell?.headerImageView?.image = UIImage(named: "a")

        } else if indexPath.row == 1 {
            cell?.mainImageView?.image = UIImage(named: "2")
            cell?.mainLabel?.text = "New graphic design - LIVE FREE"
            cell?.descLabel?.text = "Cole"
            cell?.headerImageView?.image = UIImage(named: "b")

        } else if indexPath.row == 2 {
            cell?.mainImageView?.image = UIImage(named: "3")
            cell?.mainLabel?.text = "Summer sand"
            cell?.descLabel?.text = "Daniel Hooper"
            cell?.headerImageView?.image = UIImage(named: "c")

        } else {
            cell?.mainImageView?.image = UIImage(named: "4")
            cell?.mainLabel?.text = "Seeking for signal"
            cell?.descLabel?.text = "Noby-Wan Kenobi"
            cell?.headerImageView?.image = UIImage(named: "d")

        }
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

