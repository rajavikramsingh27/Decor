//  PreviewViewController.swift
//  Decor
//  Created by iOS-Appentus on 07/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit
import PanModal

class PreviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
       signInPopUp()
    }
        
}



extension PreviewViewController:UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell-Item", for:indexPath) as! CompletedTableViewCell
                    
            return cell
        } else if indexPath.row > 0 && indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellMaterial", for:indexPath) as! CompletedTableViewCell
                    
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath) as! CompletedTableViewCell
                    
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cellColor", for:indexPath) as! CompletedTableViewCell
                    
            return cell
        }
        
    }
    
}



extension PreviewViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:75, height:70)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
                
        return cell
    }
    
}


extension PreviewViewController:DelegateSignInPlease {
    func signInPopUp() {
        let storyboard = UIStoryboard (name:kCartOrder, bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInPlease") as! SignInPlease
        vc.delegate = self
        vc.userIcon = UIImage(named:"userSignIn.png")
        vc.strTitle = "Please Sign In"
        vc.strSubTitle = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod"
        vc.strSignInTitle = "Sign In"
        
        presentPanModal(vc)
    }
    
    func signIn() {
        print("signed In")
        
        pushToVC(kCartOrder,"CartViewController")
    }
    
}
