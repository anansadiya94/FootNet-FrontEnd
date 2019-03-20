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
        view.backgroundColor = UIColor.yellow
        setTabBar()
    }
    
    private func setTabBar() {
        tabBarItem.title = "homeTabBar".localize()
    }
}
