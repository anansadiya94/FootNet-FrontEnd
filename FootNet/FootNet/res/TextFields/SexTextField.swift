//
//  SexTextField.swift
//  FootNet
//
//  Created by Anan Sadiya on 07/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SexTextField: CustomTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        //Date Picker
    }
}
