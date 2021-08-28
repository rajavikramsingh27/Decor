//  MyProfileViewController.swift
//  Decor
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func btnEditProfile(_ sender:UIButton) {
        pushToVC(kHome,"EditProfileViewController")
    }
    
    @IBAction func btnMyAddress(_ sender:UIButton) {
        pushToVC(kHome,"MyAddressViewController")
    }
    
    @IBAction func btnMyCards(_ sender:UIButton) {
        pushToVC(kHome,"MyCardViewController")
    }
    
    @IBAction func btnChangePassword(_ sender:UIButton) {
        pushToVC(kHome,"ChangePasswordViewController")
    }
}
