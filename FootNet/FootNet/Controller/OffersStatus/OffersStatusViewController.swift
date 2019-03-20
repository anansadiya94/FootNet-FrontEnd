//
//  OffersStatusViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersStatusViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "offersStatusTabBar".localize()
    }
}
