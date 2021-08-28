//  PaymentViewController.swift
//  Decor
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


//https://www.figma.com/file/DMEKTglsy3Dt5JtAlQ7jeg/Ecom?node-id=0%3A1
//https://xd.adobe.com/view/29275aa8-7e7d-4088-540f-67a65cae5108-5f16/
//https://xd.adobe.com/view/7eee03bb-030c-4d51-4d29-ea3f4dc63436-08df/


import UIKit


var isCards = false


class PaymentTypeViewController: UIViewController {
    @IBOutlet weak var collCard:UICollectionView!
    @IBOutlet weak var heightCollCard:NSLayoutConstraint!
    @IBOutlet weak var txtCVV:UITextField!
    @IBOutlet weak var heightCVV:NSLayoutConstraint!
    @IBOutlet weak var topCVV:NSLayoutConstraint!
    
    var arrSelectCard = [Bool]()
    var isCVV = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isCards = false
        
        for _ in 0..<4 {
            arrSelectCard.append(false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isCards {
            showCards()
        } else {
            hideCards()
        }
        
        if isCVV {
            showCVV()
        } else {
            hideCVV()
        }
    }
    
    func showCards() {
        collCard.isHidden = false
        heightCollCard.constant = 100
        
        UIView.animate(withDuration:0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func hideCards() {
        collCard.isHidden = true
        heightCollCard.constant = 0
        UIView.animate(withDuration:0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func showCVV() {
        txtCVV.isHidden = false
        heightCVV.constant = 54
        topCVV.constant = 30
        UIView.animate(withDuration:0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    func hideCVV() {
        txtCVV.isHidden = true
        heightCVV.constant = 0
        topCVV.constant = 0
        UIView.animate(withDuration:0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func btnPayment(_ sender:UIButton) {
        let storyboard = UIStoryboard (name:kCartOrder, bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlertMesssageVC") as! AlertMesssageVC
        vc.userIcon = UIImage(named:"tickEmail.png")
        vc.strTitle = "Payment Successful!"
        vc.strSubTitle = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod"
        
        self.navigationController?.pushViewController(vc, animated:true)
    }
        
    @IBAction func btnCreditCard(_ sender:UIButton) {
        pushToVC(kCartOrder,"AddCardViewController")
    }
    
    @IBAction func btnDebitCard(_ sender:UIButton) {
        pushToVC(kCartOrder,"AddCardViewController")
    }
    
}



extension PaymentTypeViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width:155, height:100)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSelectCard.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! PaymentTypeCollectionViewCell
        
        if arrSelectCard[indexPath.row] {
            cell.viewContainer.backgroundColor = hexStringToUIColor("#77502B")
            cell.imgCardIcon.image = UIImage (named:"visaWhite.png")
            cell.lblName.textColor = UIColor.white
            cell.lblNumber.textColor = UIColor.white
        } else {
            cell.viewContainer.backgroundColor = hexStringToUIColor("#FCEDDE")
            cell.imgCardIcon.image = UIImage (named:"visaBlack.png")
            cell.lblName.textColor = UIColor.black
            cell.lblNumber.textColor = UIColor.black
        }
        
        cell.btnSelect.tag = indexPath.row
        cell.btnSelect.addTarget(self, action:#selector(btnSelect(_:)), for:.touchUpInside)
        
        return cell
    }
    
    @IBAction func btnSelect(_ sender:UIButton) {
        for i in 0..<arrSelectCard.count {
            if i == sender.tag {
                arrSelectCard[i] = true
            } else {
                arrSelectCard[i] = false
            }
        }
        collCard.reloadData()
        
        showCVV()
    }
    
}


