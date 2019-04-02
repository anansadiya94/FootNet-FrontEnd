//
//  CustomChoosePhotoButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 12/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomChoosePhotoButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let color = UIColor.colorSecondary
        let disabledColor = color.withAlphaComponent(0.3)
        let btnFont = UIFont.fontSystemS20
        clipsToBounds = true
        setTitleColor(color, for: .normal)
        setTitleColor(disabledColor, for: .disabled)
        titleLabel?.font = btnFont
    }
}
