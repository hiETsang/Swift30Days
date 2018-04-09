//
//  ViewController.swift
//  Day09
//
//  Created by canoe on 2018/4/9.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var scrollView : UIScrollView!
    var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView.init(frame: self.view.bounds)
        self.view.addSubview(scrollView);
        scrollView.delegate = self
        scrollView.maximumZoomScale = 1.5
        scrollView.minimumZoomScale = 0.5
        
        imageView = UIImageView.init(image: UIImage(named: "steve"))
        scrollView.addSubview(imageView)
        imageView.frame = CGRect.init(x: 0, y: 0, width: scrollView.frame.size.height/(imageView.image?.size.height)! * (imageView.image?.size.width)!, height: scrollView.frame.size.height)
        imageView.center = scrollView.center
        
        scrollView.contentSize = imageView.bounds.size
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        imageView.center = scrollView.center
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

