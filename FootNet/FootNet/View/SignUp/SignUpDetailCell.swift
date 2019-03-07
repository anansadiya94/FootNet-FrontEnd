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
    @IBOutlet weak var emailTextField: EmailTextField!
    @IBOutlet weak var phoneTextField: PhoneTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var sexTextField: SexTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
}
