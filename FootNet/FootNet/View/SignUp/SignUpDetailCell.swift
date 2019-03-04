//
//  SignUpDetailTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SignUpDetailCell: UITableViewCell {
    
    @IBOutlet weak var textfield: CustomTextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
}
