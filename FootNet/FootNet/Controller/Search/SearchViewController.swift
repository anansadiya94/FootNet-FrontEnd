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
        view.backgroundColor = UIColor.colorText
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "searchTabBar".localize()
    }
}
