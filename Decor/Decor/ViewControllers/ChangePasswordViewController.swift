//
//  ChangePasswordViewController.swift
//  Decor
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var txtOldPassword:UITextField!
    @IBOutlet weak var txtNewPassword:UITextField!
    @IBOutlet weak var txtConfirmPassword:UITextField!
    
    @IBOutlet var imgEye:[UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnOldPassword(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        txtOldPassword.isSecureTextEntry = !txtOldPassword.isSecureTextEntry
        imgEye[0].image = sender.isSelected ? UIImage (named:"hidePassword.png") : UIImage (named:"showPassword.png")
    }
    
    @IBAction func btnNewPassword(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        txtNewPassword.isSecureTextEntry = !txtNewPassword.isSecureTextEntry
        imgEye[1].image = sender.isSelected ? UIImage (named:"hidePassword.png") : UIImage (named:"showPassword.png")
    }
    
    @IBAction func btnConfirmNewPassword(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
        txtConfirmPassword.isSecureTextEntry = !txtConfirmPassword.isSecureTextEntry
        imgEye[2].image = sender.isSelected ? UIImage (named:"hidePassword.png") : UIImage (named:"showPassword.png")
    }

}
