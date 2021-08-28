//  PreferdColorPlatesVC.swift
//  Decor
//  Created by iOS-Appentus on 07/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class PreferdColorPlatesVC: UIViewController {
    @IBOutlet weak var collColors:UICollectionView!
    @IBOutlet weak var collSelectPlate:UICollectionView!
    
    
    @IBOutlet weak var btnNext:UIButton!
    
    var arrSelect = [Bool]()
    var arrColorName = ["Red","Pink","Purple","Deep Purple","Accessories","Prefer Color Plates"]
    
    var arrColorCode = ["#FBE3EB","#F7BACF","#F38FB0","#EF6291","#EB4079","#E81F62","#D71C5F","#C1195A","#AC1556","#870F4E","#FE80AA","#FE4080","#F40456","#C41361"]
    var arrColorCapecity = ["50","100","200","300","400","500","600","700","800","900","A 100","A 200","A 300","A 400"]
    
    var arrSelectPreferedColor = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.notSelect()
        
        for i in 0..<arrColorName.count {
            arrSelect.append(i == 0 ? true : false)
        }
        
        for _ in 0..<arrColorCode.count {
            arrSelectPreferedColor.append(false)
        }
    }
    
}



extension PreferdColorPlatesVC:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collColors {
            let width = self.view.frame.size.width
            let size = arrColorName[indexPath.row].sizeAccordingText(width,UIFont (name:"NunitoSans-Regular", size:16)!)
            return CGSize(width:size.width+40, height:35)
        } else {
            let size = collectionView.frame.size
            return CGSize(width:size.width/2-10, height:80)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collColors {
            return arrSelect.count
        } else {
            return arrSelectPreferedColor.count
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collColors {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
        
        cell.lblCateName.text = arrColorName[indexPath.row]
        cell.lblCateName.textColor = arrSelect[indexPath.row] ? UIColor.white : UIColor.black
        cell.viewContainer.backgroundColor = arrSelect[indexPath.row] ? hexStringToUIColor("#77502B") : hexStringToUIColor("#FCEDDE")
                        
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell1", for:indexPath) as! PreferedColorCollectionCell
            
            cell.viewContainer.backgroundColor = hexStringToUIColor(arrColorCode[indexPath.row])
            cell.lblColorCapecity.text = arrColorCapecity[indexPath.row]
            
            cell.viewSelected.isHidden = !arrSelectPreferedColor[indexPath.row]
            
            cell.btnSelectColor.tag = indexPath.row
            cell.btnSelectColor.addTarget(self, action:#selector(btnSelectColor), for:.touchUpInside)
            
            return cell
        }
    }
    
    @IBAction func btnSelectColor(_ sender:UIButton) {
        for i in 0..<arrSelectPreferedColor.count {
            if i == sender.tag {
                arrSelectPreferedColor[i] = !arrSelectPreferedColor[i]
                let cell = collSelectPlate.cellForItem(at:IndexPath(item:sender.tag, section:0)) as! PreferedColorCollectionCell
                cell.viewSelected.isHidden = !arrSelectPreferedColor[i]
            }
        }
        
        if arrSelectPreferedColor.contains(true) {
            btnNext.select()
        } else {
            btnNext.notSelect()
        }
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        for i in 0..<arrSelect.count {
            if i == sender.tag {
                arrSelect[i] = true
            } else {
                arrSelect[i] = false
            }
        }
        collColors.reloadData()
    }
    
}
