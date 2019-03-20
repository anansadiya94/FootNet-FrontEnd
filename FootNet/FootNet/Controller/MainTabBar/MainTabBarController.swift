//
//  MainTabBarController.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    @IBOutlet weak var homeTabBarItem: UITabBar!
    @IBOutlet weak var offerTabBarItem: UITabBar!
    @IBOutlet weak var offersStatusTabBar: UITabBar!
    @IBOutlet weak var searchTabBarItem: UITabBar!
    @IBOutlet weak var notificationsTabBarItem: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        tabBar.barTintColor = UIColor.black
        homeTabBarItem.tintColor = UIColor.colorDarkGreen
        homeTabBarItem.unselectedItemTintColor = UIColor.white
        offerTabBarItem.tintColor = UIColor.colorDarkGreen
        offerTabBarItem.unselectedItemTintColor = UIColor.white
        offersStatusTabBar.tintColor = UIColor.colorDarkGreen
        offersStatusTabBar.unselectedItemTintColor = UIColor.white
        searchTabBarItem.tintColor = UIColor.colorDarkGreen
        searchTabBarItem.unselectedItemTintColor = UIColor.white
        notificationsTabBarItem.tintColor = UIColor.colorDarkGreen
        notificationsTabBarItem.unselectedItemTintColor = UIColor.white
    }
}


