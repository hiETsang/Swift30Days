//
//  ViewController.swift
//  Day04
//
//  Created by canoe on 2018/3/10.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: screenWidth*3, height: screenHeight)
        self.view.addSubview(scrollView)
        
        
        let leftVc = LeftController()
        let rightVc = RightController()
        let cameraVc = CameraController()
        
        self.addChildViewController(leftVc)
        self.addChildViewController(rightVc)
        self.addChildViewController(cameraVc)
        
        scrollView.addSubview(leftVc.view)
        scrollView.addSubview(rightVc.view)
        scrollView.addSubview(cameraVc.view)
        
        leftVc.view.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)
        cameraVc.view.frame = CGRect.init(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightVc.view.frame = CGRect.init(x: screenWidth * 2, y: 0, width: screenWidth, height: screenHeight)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

