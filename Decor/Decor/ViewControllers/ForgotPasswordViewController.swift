//
//  ForgotPasswordViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 05/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueBtn(_ sender: UIButton) {
        pushToVC(kMain,"EmailSentViewController")
    }
    
}
