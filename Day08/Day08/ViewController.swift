//
//  ViewController.swift
//  Day08
//
//  Created by canoe on 2018/3/30.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    var timer:Timer?
    
    @IBOutlet weak var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 35
    }

    @IBAction func playAudio(_ sender: UIButton) {
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let audioError as NSError {
            print(audioError)
        }
        
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.gradientLayerChangeColor), userInfo: nil, repeats: true)
        }
        
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.locations = [0.10, 0.50, 0.90]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    @objc func gradientLayerChangeColor() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

