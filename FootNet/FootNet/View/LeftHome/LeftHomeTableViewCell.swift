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
    @IBOutlet weak var fullNameLabel: CustomLeftHomeLabel!
    @IBOutlet weak var profileTypeLabel: CustomLeftHomeLabel!
    @IBOutlet weak var myProfileLabel: CustomLeftHomeLabel!
    @IBOutlet weak var myPublicationsLabel: CustomLeftHomeLabel!
    @IBOutlet weak var myFriendsLabel: CustomLeftHomeLabel!
    @IBOutlet weak var myContactsLabel: CustomLeftHomeLabel!
    @IBOutlet weak var editProfileLabel: CustomLeftHomeLabel!
    @IBOutlet weak var signOutLabel: CustomLeftHomeLabel!
    @IBOutlet weak var deactivateAccountLabel: CustomLeftHomeLabel!
    @IBOutlet weak var aboutUsLabel: CustomLeftHomeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
