//  SettingsViewController.swift
//  Decor
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class SettingsViewController: UIViewController {
    var arrTitle = ["About Us","Terms of Service","Privacy Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}



extension SettingsViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath)
        
        let lblTitle = cell.viewWithTag(1) as! UILabel
        lblTitle.text = arrTitle[indexPath.row]
        
        return cell
    }
    
}
