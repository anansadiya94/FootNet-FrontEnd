//
//  HomeViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "homeTabBar".localize()
    }
}
