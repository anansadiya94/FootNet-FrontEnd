//
//  OffersStatusTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 01/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersStatusTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: CustomImageView!
    @IBOutlet weak var offerStatusDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
}