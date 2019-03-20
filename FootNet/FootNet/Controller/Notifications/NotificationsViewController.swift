//
//  NotificationsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "notificationsTabBar".localize()
    }
}