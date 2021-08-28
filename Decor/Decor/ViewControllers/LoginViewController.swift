//  LoginViewController.swift
//  Decor
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.



import UIKit
import PanModal


var countryCodeSelected = "+91"


class LoginViewController: UIViewController {
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    
    @IBOutlet weak var viewNumberContainer:UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.countryCodeBtn.setTitle(countryCodeSelected, for: .normal)
    }
        
    @IBAction func continueBtn(_ sender:UIButton) {
       pushToVC(kMain,"VerifyPhoneNumberVC")
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        pushToVC(kMain,"SignUpViewController")
    }
    
    @IBAction func loginEmail(_ sender: UIButton) {
        pushToVC(kMain,"LoginEmailViewController")
    }
    
    @IBAction func selectCountryCode(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhoneNumberViewController") as! PhoneNumberViewController
        presentPanModal(vc)
    }
    
  

}
