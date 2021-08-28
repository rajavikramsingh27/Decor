//  AlertMesssageVC.swift
//  Decor
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.



import UIKit


class AlertMesssageVC: UIViewController {
    @IBOutlet weak var imgUserIcon:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubTitle:UILabel!
    
    var userIcon = UIImage (named:"")
    var strTitle = ""
    var strSubTitle = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgUserIcon.image = userIcon
        lblTitle.text = strTitle
        lblSubTitle.text = strSubTitle
    }
    
    
}
