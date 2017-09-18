//
//  ViewController.swift
//  Day03
//
//  Created by canoe on 2017/8/30.
//  Copyright © 2017年 canoe. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct showVideo {
    let name:NSString
    let title:NSString
    let desc:NSString
}

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    let dataArray = [
        showVideo(name:"videoScreenshot01",title:"哎哟还不错",desc:"新浪微博"),
        showVideo(name:"videoScreenshot02",title:"无关风月",desc:"QQ"),
        showVideo(name:"videoScreenshot03",title:"我题序等你回",desc:"微信"),
        showVideo(name:"videoScreenshot04",title:"我等春雷",desc:"即刻"),
        showVideo(name:"videoScreenshot05",title:"来提醒你爱谁",desc:"流浪诗人"),
        showVideo(name:"videoScreenshot06",title:"兰亭集序",desc:"乔克叔叔")
    ]
    
    var tableView:UITableView?
    var palyVC = AVPlayerViewController()
    var paly = AVPlayer()
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "视频展示"
        self.view.backgroundColor = .black
        self.configUI()
        
    }
    
    func configUI() {
        self.tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = .black
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        if (cell == nil) {
            cell = TableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.backgroundImageView?.image = UIImage.init(named: self.dataArray[indexPath.row].name as String)
        cell?.titleLabel?.text = self.dataArray[indexPath.row].title as String
        cell?.descLabel?.text = self.dataArray[indexPath.row].desc as String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource:"emoji zone", ofType: "mp4")
        self.paly = AVPlayer(url:URL(fileURLWithPath: path!))
        self.palyVC.player = self.paly
        
        self.present(self.palyVC, animated: true) {
            self.paly.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

