//  File.swift
//  Decor
//  Created by iOS-Appentus on 05/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class SignUpViewController: UIViewController {
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
    
    @IBAction func signUp(_ sender: UIButton) {
        pushToVC(kMain,"HomeViewController")
    }

    @IBAction func selectCountryCode(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneNumberViewController") as! PhoneNumberViewController
        presentPanModal(vc)
    }
    
}
