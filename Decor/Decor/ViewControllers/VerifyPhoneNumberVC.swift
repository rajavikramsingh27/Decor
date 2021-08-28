//
//  VerifyPhoneNumberVC.swift
//  Decor
//
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit
//import FirebaseAuth
//import SwiftMessageBar


class VerifyPhoneNumberVC: UIViewController,UITextFieldDelegate {
    @IBOutlet var otpTxt:[UITextField]!
    @IBOutlet weak var lblPhoneNumber:UILabel!
    
    @IBOutlet weak var didntRecieveOTP:UILabel!
    @IBOutlet weak var resendOTP:UIButton!
    
    @IBOutlet weak var heightOTP:NSLayoutConstraint!
    
    var verificationID = ""
    var verificationCode = ""
    
    var timer = Timer()
    var timeCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lblPhoneNumber.text = phoneNoCountryCode
        
        for i in 0..<otpTxt.count {
            otpTxt[i].keyboardType = .numberPad
            otpTxt[i].delegate = self
            otpTxt[i].tag = i
            otpTxt[i].addTarget(self, action:#selector(textField(_:)), for:.editingChanged)
        }
        
        print(otpTxt[0].frame.size.height)
        
        
        otpFunctionality()
    }
              
    override func viewDidLayoutSubviews() {
        heightOTP.constant = otpTxt[0].frame.size.width
        print(otpTxt[0].frame.size.width)
    }
    
    func otpFunctionality() {
        didntRecieveOTP.isHidden = true
        resendOTP.isHidden = true
        
        timer = Timer (timeInterval:1.0, target:self, selector:#selector(otpShow), userInfo:nil, repeats: true)
    }
    
    @objc func otpShow() {
        timeCount += 1
        
        if timeCount > 30 {
            timeCount = 0
            timer.invalidate()
            didntRecieveOTP.isHidden = false
            resendOTP.isHidden = false
        }
    }
    
    @IBAction func btnChange(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnResendNewCode(_ sender:UIButton) {
        otpFunctionality()
    }
    
    @IBAction func btnVerify(_ sender:UIButton) {
        pushToVC(kMain,"HomeViewController")
    }
    
    
    @IBAction func textField(_ sender:UITextField) {
        if sender.text!.count > 0 {
            if sender.tag == otpTxt.count-1 {
                self.view.endEditing(true)
                return
            }
            otpTxt[sender.tag+1].becomeFirstResponder()
        } else {
            if sender.tag == 0 {
                return
            }
            if sender.text == "" {
                otpTxt[sender.tag-1].becomeFirstResponder()
            } else {
                otpTxt[sender.tag+1].becomeFirstResponder()
            }
        }
    }
    
    
}
