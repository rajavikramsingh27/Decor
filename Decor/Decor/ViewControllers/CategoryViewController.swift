//
//  CategoryViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet var imgPersonNumber:[UIImageView]!
    @IBOutlet var lblPersonNumber:[UILabel]!
    @IBOutlet var btnSelectPerson:[UIButton]!
    
    let arrCate = ["Classic","Modern","New Classic","Islamic","Classic","Modern","New Classic","Islamic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<btnSelectPerson.count {
            btnSelectPerson[i].tag = i
            btnSelectPerson[i].addTarget(self, action:#selector(btnSelectPerson(_:)), for: .touchUpInside)
        }
        
        btnSelectPerson(btnSelectPerson[0])
    }
    
    @IBAction func btnSelectPerson(_ sender:UIButton) {
        for i in 0..<btnSelectPerson.count {
            if i == sender.tag {
                imgPersonNumber[i].image = UIImage (named:"selectPolygon.png")
                lblPersonNumber[i].textColor = UIColor.white
            } else {
                imgPersonNumber[i].image = UIImage (named:"unSelectPolygon .png")
                lblPersonNumber[i].textColor = UIColor.black
            }
        }
    }

}



extension CategoryViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCate.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! CategoryTableViewCell
        
        cell.cateName.text = arrCate[indexPath.row]
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        pushToVC(kMain,"SubCategoryViewController")
    }
    
}
