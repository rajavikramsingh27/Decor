//
//  ChatViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 09/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ChatViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! NotificationsTableViewCell
        
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        pushToVC(kHome,"ChatOrderViewController")
    }
    
    
}
