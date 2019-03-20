//
//  MainTabBarController.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        //setupTabBar()
    }
    
//    func setupTabBar() {
//
//        let videoController = createNavController(vc: HomeViewController(), selected: #imageLiteral(resourceName: "video_white"), unselected: #imageLiteral(resourceName: "video_black"))
//        let favoriteController = createNavController(vc: OffersViewController(), selected: #imageLiteral(resourceName: "star_white"), unselected: #imageLiteral(resourceName: "star_black"))
//
//        viewControllers = [videoController, favoriteController]
//
//        guard let items = tabBar.items else { return }
//
//        for item in items {
//            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
//        }
//    }
    
}

//extension UITabBarController {
//
//    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
//        let viewController = vc
//        let navController = UINavigationController(rootViewController: viewController)
//        navController.tabBarItem.image = unselected
//        navController.tabBarItem.selectedImage = selected
//        return navController
//    }
//}
