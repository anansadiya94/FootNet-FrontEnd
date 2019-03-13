//
//  CustomView.swift
//  FootNet
//
//  Created by Anan Sadiya on 13/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let color = UIColor.colorDarkGreen
        layer.cornerRadius = 5.0
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
}
