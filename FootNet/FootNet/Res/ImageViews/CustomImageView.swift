//
//  CustomImageView.swift
//  FootNet
//
//  Created by Anan Sadiya on 12/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
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
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = color.cgColor
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        contentMode = .scaleToFill
    }
}
