//
//  CustomTextField.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomTextField: NoPasteTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.font = UIFont.fontSystemS20
        self.textColor = UIColor.colorPrimary
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.keyboardType = .default
        self.keyboardAppearance = .dark
        self.endEditing(true)
    }
}
