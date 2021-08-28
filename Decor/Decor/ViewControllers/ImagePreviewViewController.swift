//  ImagePreviewViewController.swift
//  Decor
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit

class ImagePreviewViewController: UIViewController {
    @IBOutlet weak var collFull:UICollectionView!
    @IBOutlet weak var collBottom:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
}



extension ImagePreviewViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,
UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collFull {
            return collectionView.frame.size
        } else {
            return CGSize(width:105, height:129)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collFull {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell1", for:indexPath)
                
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell2", for:indexPath)
            
            return cell
        }
    }
    
}
