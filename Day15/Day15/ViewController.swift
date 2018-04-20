//
//  ViewController.swift
//  Day15
//
//  Created by canoe on 2018/4/15.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController")
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0 ... 100000 {
            let subView = UIView(frame: CGRect(x: 0, y: 0 + i * 3, width: Int(view.frame.size.width), height: 500))
            subView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            view.addSubview(subView)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController -- viewDidAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

