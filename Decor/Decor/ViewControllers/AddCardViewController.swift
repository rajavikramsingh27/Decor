//  AddCardViewController.swift
//  Decor
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class AddCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isCards = true
    }
    
    @IBAction func btnCheck(_ sender:UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func btnAddCard(_ sender:UIButton) {
        pushToVC(kCartOrder,"InvoiceViewController")
        
    }
    
}
