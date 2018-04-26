//
//  ViewController.swift
//  Day18
//
//  Created by canoe on 2018/4/25.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mybutton = UIButton(type: .custom)
        let rightButton = UIButton(type: .custom)
        view.addSubview(mybutton)
        view.addSubview(rightButton)
        rightButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

