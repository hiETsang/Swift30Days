//
//  ViewController.swift
//  Day12
//
//  Created by canoe on 2018/4/13.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginIn(_ sender: UIButton) {
        let animation = CATransition.init()
        animation.duration = 0.5
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFromRight
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.view.window?.layer.add(animation, forKey: nil)
        self.present(LoginViewController(), animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

