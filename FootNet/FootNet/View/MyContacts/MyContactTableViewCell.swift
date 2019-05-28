//
//  MyContactTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyContactTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var emailLabel: CustomContentLabel!
    @IBOutlet weak var phoneLabel: CustomContentLabel!
    
    var contactdId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(id: Int, img: String, fullName: String, email: String, phone: String) {
        self.contactdId = id
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        emailLabel.text = email
        phoneLabel.text = phone
    }

}
