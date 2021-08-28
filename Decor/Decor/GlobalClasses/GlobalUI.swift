//  File.swift
//  Decor
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import Foundation
import UIKit


extension UIButton {
    func notSelect() {
        self.isUserInteractionEnabled = false
        self.backgroundColor = hexStringToUIColor("#B6B6B6")
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
    
    func select() {
        self.isUserInteractionEnabled = true
        self.backgroundColor = hexStringToUIColor("#77502B")
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
}
