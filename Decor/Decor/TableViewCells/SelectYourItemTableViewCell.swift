//  SelectYourItemTableViewCell.swift
//  Decor
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


class SelectYourItemTableViewCell: UITableViewCell {
    @IBOutlet weak var imgItem:UIImageView!
    @IBOutlet weak var btnSelect:UIButton!
    
    @IBOutlet weak var btnImagePreview:UIButton!
    @IBOutlet weak var btnAdd:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
