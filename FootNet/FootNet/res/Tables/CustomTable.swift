//
//  CustomTable.swift
//  FootNet
//
//  Created by Anan Sadiya on 06/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomTable: UITableView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.separatorStyle = .none
    }
}
