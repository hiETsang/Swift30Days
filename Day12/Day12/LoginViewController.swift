//
//  LoginViewController.swift
//  Day12
//
//  Created by canoe on 2018/4/13.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

class LoginViewController: UIViewController {
    
    var nameTextField : UITextField!
    var passwordTextField : UITextField!
    var loginButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 23/255, green: 176/255, blue: 3/255, alpha: 1)
        
        let animation = CATransition()
        animation.duration = 0.8
        animation.type = "cube"
        animation.subtype = kCATransitionFromRight
        self.view.layer.add(animation, forKey: nil)
        
        let backButton = UIButton.init(type: .custom)
        backButton.frame = CGRect.init(x: 0, y: 20, width: 44, height: 44)
        backButton.setImage(UIImage.init(named: "Back-icon"), for: .normal)
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 44))
        titleLabel.text = "LoginInViewController"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        
        let leftX = (kScreenWidth - 320)/2.0
        
        nameTextField = UITextField.init(frame: CGRect.init(x: -kScreenWidth + leftX, y: 93, width: 320, height: 50))
        view.addSubview(nameTextField)
        nameTextField.placeholder = "userName"
        nameTextField.font = UIFont.systemFont(ofSize: 14)
        nameTextField.borderStyle = .roundedRect
        
        passwordTextField = UITextField.init(frame: CGRect.init(x: -kScreenWidth + leftX, y: 93 + 70, width: 320, height: 50))
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = "passWord"
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.borderStyle = .roundedRect
        
        loginButton = UIButton.init(type: .custom)
        loginButton.frame = CGRect.init(x: -((kScreenWidth - 150)/2 + 150), y: 93 + 70 + 85, width: 150, height: 50)
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.init(red: 26/255, green: 135/255, blue: 4/255, alpha: 1)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 5;
        loginButton.isUserInteractionEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
            var frame = self.nameTextField.frame
            frame.origin.x = (kScreenWidth - 320)/2.0
            self.nameTextField.frame = frame
        }) { finish in
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
            var frame = self.passwordTextField.frame
            frame.origin.x = (kScreenWidth - 320)/2.0
            self.passwordTextField.frame = frame
        }) { finish in
            self.loginButton.isUserInteractionEnabled = true
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.7, options: .curveEaseInOut, animations: {
            var frame = self.loginButton.frame
            frame.origin.x = (kScreenWidth - 150)/2.0
            self.loginButton.frame = frame
        }, completion: nil)
    }
    
    @objc func backButtonClick()  {
        let animation = CATransition.init()
        animation.duration = 0.5
        animation.type = kCATransitionFade
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.view.window?.layer.add(animation, forKey: nil)
        self.dismiss(animated: false, completion: nil)
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
