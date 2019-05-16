//
//  CustomRequestButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 16/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomRequestButton: UIButton {
    class func setup(_ customRequestButton: CustomRequestButton, _ amIRequested: Bool) {
        var color: UIColor
        if(amIRequested) {
            color = UIColor.colorSecondary
            customRequestButton.setTitle("requested_button".localize(), for: .normal)
        } else {
            color = .red
            customRequestButton.setTitle("request_button".localize(), for: .normal)
        }
        let disabledColor = color.withAlphaComponent(0.3)
        let btnFont = UIFont.fontSystemS26
        customRequestButton.clipsToBounds = true
        customRequestButton.layer.cornerRadius = 5.0
        customRequestButton.layer.borderColor = color.cgColor
        customRequestButton.layer.borderWidth = 1
        customRequestButton.setTitleColor(color, for: .normal)
        customRequestButton.setTitleColor(disabledColor, for: .disabled)
        customRequestButton.titleLabel?.font = btnFont
        customRequestButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
