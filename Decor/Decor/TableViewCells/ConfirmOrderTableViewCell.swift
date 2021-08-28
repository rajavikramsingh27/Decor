//
//  ConfirmOrderTableViewCell.swift
//  Decor
//
//  Created by iOS-Appentus on 08/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class ConfirmOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var btnCheck:UIButton!
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblAddress:UILabel!
    @IBOutlet weak var lblNumber:UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
