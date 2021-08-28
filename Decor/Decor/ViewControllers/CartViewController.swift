//
//  CartViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit
import PanModal

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnViewInvoice(_ sender:UIButton) {
        pushToVC(kCartOrder,"InvoiceViewController")
    }
    
    @IBAction func btnConfirm(_ sender:UIButton) {
       pushToVC(kCartOrder,"ConfirmOrderViewController")
    }
        
}



extension CartViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell-Item", for:indexPath) as! CompletedTableViewCell
            
            cell.btnRemove.tag = indexPath.row
            cell.btnRemove.addTarget(self, action:#selector(btnRemove(_:)), for:.touchUpInside)
            
            return cell
        } else if indexPath.row > 0 && indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellMaterial", for:indexPath) as! CompletedTableViewCell
            
            cell.btnRemove.tag = indexPath.row
            cell.btnRemove.addTarget(self, action:#selector(btnRemove(_:)), for:.touchUpInside)
            
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath) as! CompletedTableViewCell
            
            cell.btnRemove.tag = indexPath.row
            cell.btnRemove.addTarget(self, action:#selector(btnRemove(_:)), for:.touchUpInside)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath)
            
            return cell
        }
        
    }
    
    @IBAction func btnRemove(_ sender:UIButton) {
        signInPopUp()
    }
    
}

extension CartViewController:DelegateSignInPlease {
    func signInPopUp() {
        let storyboard = UIStoryboard (name:kCartOrder, bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInPlease") as! SignInPlease
        vc.delegate = self
        vc.userIcon = UIImage(named:"cancel-Item.png")
        vc.strTitle = "Remove Item"
        vc.strSubTitle = "Are you sure you want to remove this item?"
        vc.strSignInTitle = "Remove"
        
        presentPanModal(vc)
    }
    
    func signIn() {
        print("signed In")
    }
    
}
