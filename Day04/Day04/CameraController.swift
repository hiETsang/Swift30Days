//
//  CameraController.swift
//  Day04
//
//  Created by canoe on 2018/3/10.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController {
    
    var preViewlayer : AVCaptureVideoPreviewLayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        preViewlayer?.frame = view.bounds
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true;
        
        //相机
        
        let session = AVCaptureSession()
        session.sessionPreset = .high
        
        let availableCameraDevices = AVCaptureDevice.default(for: AVMediaType.video)
        var error:NSError?
        var cameraInput:AVCaptureDeviceInput!
        
        do {
            cameraInput = try AVCaptureDeviceInput(device: availableCameraDevices!)
        } catch let error1 as NSError {
            error = error1
            cameraInput = nil
        }
        
        if error == nil && session.canAddInput(cameraInput) {
            session.addInput(cameraInput)
            
            preViewlayer = AVCaptureVideoPreviewLayer(session:session)
            preViewlayer?.videoGravity = .resizeAspect
            preViewlayer?.connection?.videoOrientation = .portrait
            self.view.layer.addSublayer(preViewlayer!)
            session.startRunning()
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
