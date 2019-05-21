//
//  CustomContentLabel.swift
//  FootNet
//
//  Created by Anan Sadiya on 21/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomContentLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.colorText
    }
}
