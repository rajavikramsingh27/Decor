//
//  LoginEmailViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class LoginEmailViewController: UIViewController {
    @IBOutlet weak var imgEye:UIImageView!
    @IBOutlet weak var passwordTF:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgEye.image = UIImage (named:"showPassword.png")
    }
    
    @IBAction func btnPasswordHideShow(_ sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            imgEye.image = UIImage (named:"hidePassword.png")
        } else {
            sender.isSelected = true
            imgEye.image = UIImage (named:"showPassword.png")
        }
        passwordTF.isSecureTextEntry = sender.isSelected
    }
    
    @IBAction func forgorPassword(_ sender: UIButton) {
        pushToVC(kMain,"ForgotPasswordViewController")
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        pushToVC(kMain,"HomeViewController")
    }

}
