//
//  ViewController.swift
//  Day10
//
//  Created by canoe on 2018/4/10.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contentURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        videoFrame = view.frame
        startTime = 2.0
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        
        alpha = 0.8
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

