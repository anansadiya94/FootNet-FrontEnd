//
//  MyProfileViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        setBackground()
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        title = "myProfileLabel".localize()
    }
}
