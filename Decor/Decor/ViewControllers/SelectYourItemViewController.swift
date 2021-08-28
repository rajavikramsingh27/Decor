//  SelectYourItemViewController.swift
//  Decor
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class SelectYourItemViewController: UIViewController {
    @IBOutlet weak var collCate:UICollectionView!
    @IBOutlet weak var collSelected:UICollectionView!
    @IBOutlet weak var tblItems:UITableView!
    
    @IBOutlet weak var btnNext:UIButton!
    
    var arrSelect = [Bool]()
    var arrCateName = ["Bed","Closet","Dressing Table","Chair"]
    var arrCateIcon = ["Bedroom.png","Closet.png","Dressing Table.png","Chair.png"]
    var arrCateIconW = ["BedroomW.png","ClosetW.png","Dressing TableW.png","ChairW.png"]
    
    var arrSelectTable = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.notSelect()
        
        for _ in 0..<arrCateIcon.count {
            arrSelect.append(false)
        }
        
        for _ in 0..<6 {
            arrSelectTable.append(false)
        }
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
        pushToVC(kMain,"MaterialViewController")
    }
    
}



extension SelectYourItemViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collCate {
            return CGSize(width:90, height:100)
        } else {
            return CGSize(width:60, height:51)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collCate {
            return arrSelect.count
        } else {
            return 16
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collCate {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
        
        let cateIcon = arrSelect[indexPath.row] ? arrCateIconW[indexPath.row] : arrCateIcon[indexPath.row]
        
        cell.imgCateIcon.image = UIImage (named:cateIcon)
        cell.lblCateName.text = arrCateName[indexPath.row]
        
        cell.viewContainer.backgroundColor = arrSelect[indexPath.row] ? hexStringToUIColor("#77502B") : hexStringToUIColor("#FCEDDE")
        
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
            
            cell.btnSelect.tag = indexPath.row
            cell.btnSelect.addTarget(self, action:#selector(btnCancelSelect), for:.touchUpInside)
            
            return cell
        }
    }
    
    func selectCell(_ cell:SelectYourItemCollectionCell,_ tag:Int) {
        cell.viewContainer.backgroundColor = arrSelect[tag] ? hexStringToUIColor("#77502B") : hexStringToUIColor("#FCEDDE")
    }
    
    @IBAction func btnCancelSelect(_ sender:UIButton) {
        
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        for i in 0..<arrSelect.count {
            if i == sender.tag {
                arrSelect[i] = true
            } else {
                arrSelect[i] = false
            }
        }
        collCate.reloadData()
    }
    
}



extension SelectYourItemViewController:UITableViewDelegate,UITableViewDataSource {
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
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelectTable(_:)), for:.touchUpInside)
        
        cell.btnImagePreview.tag = indexPath.row
        cell.btnImagePreview.addTarget(self, action:#selector(btnImagePreview), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnImagePreview(_ sender:UIButton) {
        pushToVC(kMain,"ImagePreviewViewController")
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
