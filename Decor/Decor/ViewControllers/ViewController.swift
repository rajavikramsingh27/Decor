//  ViewController.swift
//  Decor
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline:.now()+3) {
            self.pushToVC(kMain,"WalkthroughtViewController")
        }
    }


}

