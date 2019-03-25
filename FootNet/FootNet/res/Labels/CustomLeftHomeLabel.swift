//
//  CustomLeftHomeLabel.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomLeftHomeLabel: UILabel {
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
        self.textColor = UIColor.white
    }
}
