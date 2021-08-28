 //  MaterialViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit

class MaterialViewController: UIViewController {
    @IBOutlet weak var collCate:UICollectionView!
    @IBOutlet weak var tblItems:UITableView!
    @IBOutlet weak var viewContainerPreferedColor:UIView!
    
    @IBOutlet weak var btnNext:UIButton!
    
    var arrSelect = [Bool]()
    var arrCateName = ["Flooring","Wall","Sealing","Lightning","Accessories","Prefer Color Plates"]
        
    var arrSelectTable = [Bool]()
    
    var isLightning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewContainerPreferedColor.isHidden = true
        
        btnNext.notSelect()
        
        for i in 0..<arrCateName.count {
            if i == 0 {
                arrSelect.append(true)
            } else {
                arrSelect.append(false)
            }
        }
        
        for _ in 0..<10 {
            arrSelectTable.append(false)
        }
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
        pushToVC(kMain,"SizeRoomViewController")
    }
    
}



extension MaterialViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let size = arrCateName[indexPath.row].sizeAccordingText(width,UIFont (name:"NunitoSans-Regular", size:16)!)
        return CGSize(width:size.width+20, height:50)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSelect.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
        
        cell.lblCateName.text = arrCateName[indexPath.row]
        cell.lblCateName.textColor = arrSelect[indexPath.row] ? hexStringToUIColor("#77502B") : hexStringToUIColor("#787878")
        cell.viewContainer.isHidden = !arrSelect[indexPath.row]
                        
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        for i in 0..<arrSelect.count {
            if i == sender.tag {
                if i == 3 {
                    isLightning = true
                } else {
                    isLightning = false
                }
                
                if i == arrSelect.count-1 {
                    viewContainerPreferedColor.isHidden = false
                } else {
                    viewContainerPreferedColor.isHidden = true
                }
                arrSelect[i] = true
            } else {
                arrSelect[i] = false
            }
        }
        
        
        
        collCate.reloadData()
        tblItems.reloadData()
    }
    
}



extension MaterialViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6 //arrCate.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! SelectYourItemTableViewCell
        
//        cell.cateName.text = arrCate[indexPath.row]
        cell.btnAdd.isHidden = arrSelectTable[indexPath.row]
        if isLightning {
            cell.imgItem.image = UIImage (named:"Lightning.png")
        } else {
            cell.imgItem.image = UIImage (named:"Florring.png")
        }
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelectTable(_:)), for:.touchUpInside)
                
        return cell
    }
    
    @IBAction func btnSelectTable(_ sender:UIButton) {
        for i in 0..<arrSelectTable.count {
            if i == sender.tag {
                arrSelectTable[i] = !arrSelectTable[i]
                let cell = tblItems.cellForRow(at:IndexPath(item:sender.tag, section:0)) as! SelectYourItemTableViewCell
                cell.btnAdd.isHidden = arrSelectTable[i]
            }
        }
        if arrSelectTable.contains(true) {
            btnNext.select()
        } else {
            btnNext.notSelect()
        }
    }
    
}

