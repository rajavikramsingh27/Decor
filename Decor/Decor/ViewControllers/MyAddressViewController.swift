//
//  MyAddressViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class MyAddressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnChangeAddress(_ sender:UIButton) {
        pushToVC(kCartOrder,"AddressViewController")
    }
    
}

