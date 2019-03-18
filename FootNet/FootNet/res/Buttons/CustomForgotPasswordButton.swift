//
//  CustomForgotPasswordButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 28/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomForgotPasswordButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let btnFont = UIFont.fontSystemS13
        let color = UIColor.colorDarkGreen
        let disabledColor = color.withAlphaComponent(0.3)
        clipsToBounds = true
        setTitleColor(color, for: .normal)
        setTitleColor(disabledColor, for: .disabled)
        titleLabel?.font = btnFont
    }
}
