//
//  ViewController.swift
//  Day01
//
//  Created by canoe on 2017/5/2.
//  Copyright © 2017年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLable: UILabel!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var count = 0.0
    var timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.countLable.text = String(count)
    }

    @IBAction func beginButtonClick(_ sender: UIButton) {
        beginButton.isEnabled = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCountLabel), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCountLabel() {
        count = count + 0.1
        countLable.text = String(format:"%0.1f",count)
    }
    
    
    @IBAction func stopButtonClick(_ sender: UIButton) {
        beginButton.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
        updateCountLabel()
    }
    
    
    @IBAction func resetButtonClick(_ sender: UIButton) {
        timer.invalidate()
        count = 0.0
        countLable.text = String(format:"%0.1f",count)
        stopButton.isEnabled = false
        beginButton.isEnabled = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

