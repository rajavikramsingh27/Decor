//  ConfirmOrderViewController.swift
//  Decor
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit

var isAddressed = false

class ConfirmOrderViewController: UIViewController {
    @IBOutlet weak var heightAddress:NSLayoutConstraint!
    @IBOutlet weak var tblAddress:UITableView!
    @IBOutlet weak var btnAddress:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isAddressed = false
        btnAddress.addTarget(self, action:#selector(btnCheck(_:)), for:.touchUpInside)
        hideAddress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isAddressed {
            showAddress()
        } else {
            hideAddress()
        }
    }
    
    func hideAddress() {
        heightAddress.constant = 54
        tblAddress.isHidden = true
        btnAddress.isHidden = false
    }
    
    func showAddress() {
        heightAddress.constant = 150+80
        tblAddress.isHidden = false
        btnAddress.isHidden = true
    }
    
    @IBAction func btnContinue(_ sender:UIButton) {
        pushToVC(kCartOrder,"PaymentTypeViewController")
    }

}



extension ConfirmOrderViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! ConfirmOrderTableViewCell
        
        cell.btnCheck.isSelected = true
        
//        cell.btnCheck.tag = indexPath.row
//        cell.btnCheck.addTarget(self, action:#selector(btnCheck(_:)), for:.touchUpInside)
        
        return cell
    }
        
    @IBAction func btnCheck(_ sender:UIButton) {
        pushToVC(kCartOrder,"AddressViewController")
    }
    
    
}
