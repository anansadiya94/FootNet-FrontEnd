//
//  CustomButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomSignInSignUpButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let color = UIColor.colorDarkGreen
        let disabledColor = color.withAlphaComponent(0.3)
        let btnFont = UIFont.fontNoteworthyS26
        clipsToBounds = true
        layer.cornerRadius = 5.0
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
        setTitleColor(color, for: .normal)
        setTitleColor(disabledColor, for: .disabled)
        titleLabel?.font = btnFont
    }
}



