//
//  CustomTextView.swift
//  FootNet
//
//  Created by Anan Sadiya on 12/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        keyboardAppearance = .dark
        font = UIFont.fontNoteworthyS20
        autocorrectionType = .no
        spellCheckingType = .no
        keyboardType = .default
    }
}
