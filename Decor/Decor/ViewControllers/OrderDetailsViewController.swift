//  OrderDetailsViewController.swift
//  Decor
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit



class OrderDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnViewInvoice(_ sender:UIButton) {
        pushToVC(kCartOrder,"InvoiceViewController")
    }
    
    @IBAction func btnCheckOrderStatus(_ sender:UIButton) {
        pushToVC(kHome,"OrderStatusViewController")
    }
    
}



extension OrderDetailsViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell-Item", for:indexPath) as! CompletedTableViewCell
            
            return cell
        } else if indexPath.row > 0 && indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellMaterial", for:indexPath) as! CompletedTableViewCell
            
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath) as! CompletedTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath)
            
            return cell
        }
        
    }
}

