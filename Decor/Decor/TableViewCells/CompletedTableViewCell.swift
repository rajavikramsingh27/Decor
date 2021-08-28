//
//  CompletedTableViewCell.swift
//  Decor
//
//  Created by iOS-Appentus on 07/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {
    @IBOutlet weak var imgDecor:UIImageView!
    @IBOutlet weak var lblDecorName:UILabel!
    @IBOutlet weak var lblDeocrDescr:UILabel!
    
    @IBOutlet weak var btnRemove:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
