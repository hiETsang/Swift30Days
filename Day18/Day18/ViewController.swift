//
//  ViewController.swift
//  Day18
//
//  Created by canoe on 2018/4/25.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        headerImageView.clipsToBounds = true
        headerImageView.layer.cornerRadius = headerImageView.bounds.size.width / 2.0
        
        textView.delegate = self
        textView.backgroundColor = UIColor.clear
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboradWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboradWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboradWillShow(notification: NSNotification) {
        
        let userInfo = notification.userInfo
        let value = userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardRect = value?.cgRectValue
        let height:CGFloat = (keyboardRect?.size.height)!
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                self.bottomView.transform = CGAffineTransform(translationX: 0, y: -height)
            }, completion: nil)
        }else
        {
            self.bottomView.transform = CGAffineTransform(translationX: 0, y: -height)
        }
    }
    
    @objc func keyboradWillHide(notification: NSNotification) {
        let userInfo = notification.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        if duration > 0 {
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                self.bottomView.transform = CGAffineTransform.identity
            }, completion: nil)
        }else
        {
            self.bottomView.transform = CGAffineTransform.identity
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 140 {
            textView.text = String(textView.text.prefix(140))
        }
        self.countLabel.text = "\(140 - textView.text.count)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

