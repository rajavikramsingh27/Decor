//  CompletedViewController.swift
//  Decor
//  Created by iOS-Appentus on 07/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class CompletedViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
        pushToVC(kMain,"PreviewViewController")
    }
    
}



extension CompletedViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! CompletedTableViewCell
        
        
        return cell
    }
    
}
