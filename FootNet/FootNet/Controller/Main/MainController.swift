//
//  MainController.swift
//  FootNet
//
//  Created by Anan Sadiya on 14/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class MainController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.hidesBackButton = true
        navigationItem.title = "FootNet"
    }
}
