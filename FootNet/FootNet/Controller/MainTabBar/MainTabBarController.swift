//
//  MainTabBarController.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    @IBOutlet weak var homeTabBar: UITabBar!
    @IBOutlet weak var offerTabBar: UITabBar!
    @IBOutlet weak var offersStatusTab: UITabBar!
    @IBOutlet weak var searchTabBar: UITabBar!
    @IBOutlet weak var notificationsTabBar: UITabBar!

    let home = HomeViewController()
    let offers = OffersViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load all view
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
        setTabBar()
    }
    
    private func setTabBar() {
        tabBar.barTintColor = UIColor.black
        homeTabBar.tintColor = UIColor.colorDarkGreen
        homeTabBar.unselectedItemTintColor = UIColor.white
        offerTabBar.tintColor = UIColor.colorDarkGreen
        offerTabBar.unselectedItemTintColor = UIColor.white
        offersStatusTab.tintColor = UIColor.colorDarkGreen
        offersStatusTab.unselectedItemTintColor = UIColor.white
        searchTabBar.tintColor = UIColor.colorDarkGreen
        searchTabBar.unselectedItemTintColor = UIColor.white
        notificationsTabBar.tintColor = UIColor.colorDarkGreen
        notificationsTabBar.unselectedItemTintColor = UIColor.white
    }
}


