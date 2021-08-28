//  PopUpViewController.swift
//  Decor
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.



protocol DelegateSignInPlease {
    func signIn()
}



import UIKit
import PanModal



class SignInPlease: UIViewController {
    @IBOutlet weak var imgUserIcon:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubTitle:UILabel!
    @IBOutlet weak var btnSignInTitle:UIButton!
    
    var userIcon = UIImage (named:"")
    var strTitle = ""
    var strSubTitle = ""
    var strSignInTitle = ""
    
    var delegate:DelegateSignInPlease?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgUserIcon.image = userIcon
        lblTitle.text = strTitle
        lblSubTitle.text = strSubTitle
        
        btnSignInTitle.setTitle(strSignInTitle, for:.normal)
    }
    
    
    
    @IBAction func btnSignIn(_ sender:UIButton) {
        dismiss(animated:true, completion:nil)
        delegate?.signIn()
    }

    
    
}



extension SignInPlease: PanModalPresentable {

    var cornerRadius: CGFloat {
        return 30
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .contentHeight(400)
//        return .maxHeightWithTopInset(444)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
}
