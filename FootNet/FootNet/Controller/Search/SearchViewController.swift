//
//  SearchViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        setBackground()
=======
        view.backgroundColor = UIColor.colorText
>>>>>>> 2abd128a006eb839b65ae9eb118baaa86186a228
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "searchTabBar".localize()
    }
}
