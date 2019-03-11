//
//  SignUpDetailTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SignUpDetailCell: UITableViewCell {
    
    @IBOutlet weak var normalTextField: CustomTextField!
    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var pickerViewTextField: CustomTextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var profileLabelImageView: UILabel!
    @IBOutlet weak var changeImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
}
