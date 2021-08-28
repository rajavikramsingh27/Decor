//  SelectRoomViewController.swift
//  Decor
//  Created by iOS-Appentus on 07/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit
import MobileCoreServices
import AVKit


class SizeRoomViewController: UIViewController {
    @IBOutlet weak var viewVideoContainer:UIView!
    @IBOutlet weak var imgVideoThumbnail:UIImageView!
    @IBOutlet weak var btnCancelVideo:UIButton!
    
    var videoURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func showVideoContainer() {
        btnCancelVideo.isHidden = false
        viewVideoContainer.isHidden = false
    }
    
    func hideVideoContainer() {
        btnCancelVideo.isHidden = true
        viewVideoContainer.isHidden = true
    }
    
    @IBAction func btnNext(_ sender:UIButton) {
        pushToVC(kMain,"CompletedViewController")
    }
    
    @IBAction func btnPlayVideo(_ sender:UIButton) {
        let player = AVPlayer(url:self.videoURL!)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
    @IBAction func btnCancelVideo(_ sender:UIButton) {
        hideVideoContainer()
    }
}



extension SizeRoomViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:70, height:70)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for:indexPath) as! SelectYourItemCollectionCell
        
        
        
        return cell
    }
    
}



extension SizeRoomViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBAction func openCamera(_ sender:UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func openGallery(_ sender:UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
        }
        
        if let videoURL = info[.mediaURL] as? URL {
            
            showVideoContainer()
            self.videoURL = videoURL
            self.imgVideoThumbnail.image = self.videoURL!.createVideoThumbnail
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
