//
//  OfferViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "offersTabBar".localize()
    }
}
