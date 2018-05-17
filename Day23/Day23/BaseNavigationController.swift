//
//  BaseNavigationController.swift
//  Day23
//
//  Created by canoe on 2018/5/17.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    var currentViewController : BaseViewController!
    var root : BackTableViewController!{
        didSet{
            weak var weakSelf = self
            root?.selectRow = { str in
                
                weakSelf?.currentViewController.removeFromParentViewController()
                weakSelf?.currentViewController.view.removeFromSuperview()
                
                var vc : BaseViewController = BaseViewController()
                
                switch str {
                case "FriendRead":
                    vc = FriendReadViewController()
                case "Article":
                    vc = ArticleViewController()
                case "ReadLater":
                    vc = ReadLaterViewController()
                default:
                    break
                }
                
                self.addChildViewController(vc)
                self.view.addSubview(vc.view)
                self.currentViewController = vc
                self.currentViewController.view.frame = CGRect(x: UIScreen.main.bounds.width - 150, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
                
                UIView.animate(withDuration: 0.7, animations: {
                    self.currentViewController.view.frame = self.view.bounds
                })
                
                self.currentViewController.didTouch = {
                    UIView.animate(withDuration: 0.7, animations: {
                        self.currentViewController.view.frame = CGRect(x: UIScreen.main.bounds.width - 150, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
                    })
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarHidden(true, animated: false)
        
        let friendVc = FriendReadViewController()
        self.addChildViewController(friendVc)
        self.view.addSubview(friendVc.view)
        self.currentViewController = friendVc
        
        self.currentViewController.view.frame = self.view.bounds
        
        self.currentViewController.didTouch = {
            UIView.animate(withDuration: 0.7, animations: {
                self.currentViewController.view.frame = CGRect(x: UIScreen.main.bounds.width - 150, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
            })
        }
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
