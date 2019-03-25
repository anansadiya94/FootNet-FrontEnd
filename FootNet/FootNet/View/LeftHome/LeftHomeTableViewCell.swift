//
//  LeftHomeTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class LeftHomeTableViewCell: UITableViewCell {
    @IBOutlet weak var img: CustomImageView!
    @IBOutlet weak var nameSurnameLabel: CustomLeftHomeLabel!
    @IBOutlet weak var profileTypeLabel: CustomLeftHomeLabel!
    @IBOutlet weak var myProfilePhoto: UIImageView!
    @IBOutlet weak var myProfileLabel: CustomLeftHomeLabel!
    @IBOutlet weak var editProfilePhoto: UIImageView!
    @IBOutlet weak var editProfileLabel: CustomLeftHomeLabel!
    @IBOutlet weak var signOutPhoto: UIImageView!
    @IBOutlet weak var signOutLabel: CustomLeftHomeLabel!
    @IBOutlet weak var deactivateAccountPhoto: UIImageView!
    @IBOutlet weak var deactivateAccountLabel: CustomLeftHomeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
