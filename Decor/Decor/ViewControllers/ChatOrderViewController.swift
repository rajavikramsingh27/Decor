//
//  ChatOrderViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class ChatOrderViewController: UIViewController {
    @IBOutlet weak var btnSend:UIButton!
    @IBOutlet weak var txtMessage:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtMessage.delegate = self
        btnSend.isHidden = true
    }
    
}



extension ChatOrderViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        btnSend.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtMessage.text!.count > 0 {
            btnSend.isHidden = false
        } else {
            btnSend.isHidden = true
        }
    }
    
}
 


extension ChatOrderViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        } else if indexPath.row == 1 {
            return 160
        } else if indexPath.row == 2 {
            return 188
        } else {
            return 116
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellGrey", for:indexPath)
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellPink", for:indexPath)
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellImage", for:indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellAttach", for:indexPath)
            
            return cell
        }
    }
    
}
