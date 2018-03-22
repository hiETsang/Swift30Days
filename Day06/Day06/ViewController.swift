//
//  ViewController.swift
//  Day06
//
//  Created by canoe on 2018/3/19.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    var manager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func locationButtonTouch(_ sender: UIButton) {
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    // MARK: CLLocationDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location!) { (placemark, error)->Void in
            if (error != nil){
                self.titleLabel.text = "不能定位！！！" + error!.localizedDescription
                return
            }
            
            if placemark!.count > 0{
                self.titleLabel.text = (placemark!.first!.administrativeArea ?? " ") + (placemark!.first!.locality ?? " ")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.titleLabel.text = "定位失败！！！" + error.localizedDescription
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

