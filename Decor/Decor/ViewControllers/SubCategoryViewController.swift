//  SubCategoryViewController.swift
//  Decor
//  Created by iOS-Appentus on 05/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class SubCategoryViewController: UIViewController {
    @IBOutlet weak var collSubCate:UICollectionView!
    @IBOutlet weak var btnNext:UIButton!
    
    var arrSelect = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.notSelect()
        
        for _ in 0..<10 {
            arrSelect.append(false)
        }
        collSubCate.reloadData()
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
        pushToVC(kMain,"SelectYourItemViewController")
    }
    
}



extension SubCategoryViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/2-4
        return CGSize (width:width, height:222)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSelect.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SubCategoriesCollectionCell
            
        cell.viewSelect.isHiddenAnimated(value:!(arrSelect[indexPath.row]))
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        for i in 0..<10 {
            if i == sender.tag {
                if arrSelect[i] {
                    arrSelect[i] = false
                } else {
                    arrSelect[i] = true
                }
                
                if let cell = self.collSubCate.cellForItem(at:IndexPath(item:sender.tag, section:0)) as? SubCategoriesCollectionCell {
//                    cell.viewSelect.isHidden = !arrSelect[i]
                    cell.viewSelect.isHiddenAnimated(value:!arrSelect[i])
                }
            }
        }
        
        if arrSelect.contains(true) {
            btnNext.select()
        } else {
            btnNext.notSelect()
        }
    }
    
}



extension UIView {
    func isHiddenAnimated(value: Bool) {
        UIView.animate(withDuration:0.3) { [weak self] in self?.isHidden = value }
    }
}
