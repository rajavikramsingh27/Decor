//  HomeViewController.swift
//  Decor
//  Created by iOS-Appentus on 05/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit
import ViewAnimator


private let reuseIdentifier = "cell"

class HomeViewController:UIViewController {
    @IBOutlet weak var btnMenu:UIButton!
    
    var arrHeight = [241,215,189,248,237,210]
    var arrShadowColor = ["#77502B","#77502B","#153539","#153539","#153539","#153539"]
    var arrTitle = ["Bedroom","Drawing Room","Kitchen","Kids Room","Lobby","Bathroom"]
    var arrIconHome = ["iconHome1.png","iconHome2.png","iconHome.png","iconHome1.png","iconHome1.png","iconHome1.png"]
    var arrLayerColor = ["#77502B","#243F4A","#284C4B","#50143C","#1C57A5","#77502B"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector:#selector(selectMenu), name: NSNotification.Name (rawValue:"sidemenu"), object:nil)
        btnMenu.addTarget(self, action:#selector(onSlideMenuButtonPressed(_:)), for: .touchUpInside)
    }
        
}



extension HomeViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize (width:collectionView.frame.width, height:220)
        } else {
            let width = collectionView.frame.size.width/2-4
            return CGSize (width:width, height:CGFloat(arrHeight[indexPath.row-1]))
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrHeight.count+1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellHeader", for:indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! HomeCollectionViewCell
            
            cell.imgHome.image = UIImage (named:"iconHome\(indexPath.row-1).png")
            cell.lblTitle.text = arrTitle[indexPath.row-1]
            let layerColor = hexStringToUIColor(arrLayerColor[indexPath.row-1]).withAlphaComponent(0.5)
            cell.layerHome.backgroundColor = layerColor
            
            cell.btnSelect.tag = indexPath.row-1
            cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
            
            return cell
        }
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        pushToVC(kMain,"CategoryViewController")
    }
    
}



extension HomeViewController {
    @objc func selectMenu(noti:Notification) {
        let index = Int("\(noti.object!)")
        
        if index == 100 {
            if !sameVC(kHome,"MyProfileViewController") {
                pushToVC(kHome, "MyProfileViewController")
            }
        } else if index == 0 {
            
        } else if index == 1 {
            if !sameVC(kHome,"ChatViewController") {
                pushToVC(kHome, "ChatViewController")
            }
        } else if index == 2 {
            if !sameVC(kHome,"MyOrderViewController") {
                pushToVC(kHome, "MyOrderViewController")
            }
        } else if index == 3 {
            if !sameVC(kHome,"NotificationViewController") {
                pushToVC(kHome, "NotificationViewController")
            }
        } else if index == 4 {
            if !sameVC(kHome,"SettingsViewController") {
                pushToVC(kHome, "SettingsViewController")
            }
        } else if index == 5 {
            let alert = UIAlertController (title: "Warning!", message: "Do you want to logout?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default) { (yes) in
                
            }
            
            let no = UIAlertAction(title: "No", style: .cancel) { (yes) in
                
            }
            
            alert.addAction(yes)
            alert.addAction(no)
            
            alert.view.tintColor = UIColor .black
            present(alert, animated: true, completion: nil)
        }
    }
}
