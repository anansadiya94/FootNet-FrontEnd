//
//  TextTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 03/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        nameSurnameLabel.textColor = UIColor.colorText
        textPostLabel.textColor = UIColor.colorText
    }
}
