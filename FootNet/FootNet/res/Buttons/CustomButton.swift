//
//  CustomButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let color = UIColor.kDarkGreen
        let disabledColor = color.withAlphaComponent(0.3)
        
        let btnFont = UIFont.buttonFontOfSize
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
        
        layer.borderColor = color.cgColor
        
        setTitleColor(color, for: .normal)
        setTitleColor(disabledColor, for: .disabled)
        titleLabel?.font = btnFont
    }
}



