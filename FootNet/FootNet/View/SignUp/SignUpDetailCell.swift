//
//  SignUpDetailTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SignUpDetailCell: UITableViewCell {
    
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var pickerViewTextField: CustomTextField!
    @IBOutlet weak var imgView: CustomImageView!
    @IBOutlet weak var profileLabelImageView: CustomLabel!
    @IBOutlet weak var changeImageButton: CustomChoosePhotoButton!
    @IBOutlet weak var textView: CustomTextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if textField != nil {
            textField?.text = ""
        } else if dateTextField != nil {
            dateTextField?.text = ""
        } else if pickerViewTextField != nil {
            pickerViewTextField?.text = ""
        } else if textView != nil {
            textView?.text = ""
        }
    }
}
