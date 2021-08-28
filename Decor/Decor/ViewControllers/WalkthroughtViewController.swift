//
//  WalkthroughtViewController.swift
//  Decor
//
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout


class WalkthroughtViewController: UIViewController,
UICollectionViewDelegateFlowLayout,
UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collWK:UICollectionView!
    @IBOutlet weak var topPage:NSLayoutConstraint!
    @IBOutlet weak var pageControll:UIPageControl!
    @IBOutlet weak var lblNext:UILabel!
    
    var visibleIndexPath: IndexPath? = nil
    
    var currentIndex = 0
    
    var arrWKImages = ["wk1.png","wk2.png","wk3.png","wk4.png"]
    var arrWKTop = ["Lorem ipsum dolor sit amet, consetetur",
                    "Lorem ipsum dolor sit amet, consetetur",
                    "Lorem ipsum dolor sit amet, consetetur",
                    "Lorem ipsum dolor sit amet, consetetur"]
    
    var arrWKBottom = [
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et",
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et",
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collWK.isPagingEnabled = true
        let layout = AnimatedCollectionViewLayout()
        layout.animator = ParallaxAttributesAnimator()
        layout.scrollDirection = .horizontal
        collWK.collectionViewLayout = layout
        collWK.isScrollEnabled = true
        
        currentIndex = 0
        pageControll.numberOfPages = arrWKImages.count
        pageControll.currentPage = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            if let cell = self.collWK.cellForItem(at:IndexPath(item:0, section:0)) as? WalkthroughCollectionViewCell {
                print(cell.imgWK.frame.size.height - 80)
                self.topPage.constant = cell.imgWK.frame.size.height - 80
            }
        }
        
    }
    
    @IBAction func btnGetStarted(_ sender:UIButton) {
        if currentIndex == 3 {
            pushToVC(kMain,"LoginViewController")
        } else {
            lblNext.text = "Next"
                        
            currentIndex = currentIndex+1
            pageControll.currentPage = currentIndex
            
            let visibleItems: NSArray = collWK.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
            if nextItem.row < arrWKImages.count {
                collWK.scrollToItem(at: nextItem, at: .left, animated: true)
            }
            
            if currentIndex == 3 {
                lblNext.text = "Get Started"
            }
        }
    }
    
}



extension WalkthroughtViewController {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize (width:width, height:height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWKTop.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! WalkthroughCollectionViewCell
        
        cell.imgWK.image = UIImage (named:arrWKImages[indexPath.row])
        cell.lblTextTop.text = arrWKTop[indexPath.row]
        cell.lblTextBottom.text = arrWKBottom[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collWK.contentOffset
        visibleRect.size = collWK.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collWK.indexPathForItem(at: visiblePoint) else { return }
        
        currentIndex = indexPath.row
        if currentIndex == 3 {
            lblNext.text = "Get Started"
        } else {
            lblNext.text = "Next"
        }
        self.pageControll.currentPage = currentIndex
    }
    
}
