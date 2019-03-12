//
//  BaseViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 26/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorDarkBlack
        DDLogInfo("Load Base View")
    }
}

extension UIViewController {
    
    func setBackground() {
        view.backgroundColor = .colorDarkBlack
    }
}
