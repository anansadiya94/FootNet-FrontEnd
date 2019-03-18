//
//  AppNavigationDrawerRouter.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import Material

extension AppNavigationDrawer : AppNavigationDrawerDelegate {
    func didTapAwesomeButton() {
        appNavigationDrawerController?.openLeftView()
    }
}

class AppNavigationDrawer: UIViewController{
    
    var appNavigationDrawerController : AppNavigationDrawerController?
    
    func createAppNavigationDrawer () -> AppNavigationDrawerController {
        let homeViewController: HomeViewController = {
            let viewController = UIStoryboard.viewController(name: "Home", identifier: "HomeViewController") as! HomeViewController
            viewController.delegate = self
            return viewController
        }()
        
        let leftHomeViewController: LeftHomeViewController = {
            return UIStoryboard.viewController(name: "LeftHome", identifier: "LeftHomeViewController") as! LeftHomeViewController
        }()
        
        let rightViewController: RightHomeViewController = {
            return UIStoryboard.viewController(name: "RightHome", identifier: "RightHomeViewController") as! RightHomeViewController
        }()
        
        let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.topItem?.title = "FootNet"
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.barTintColor = UIColor.black


        appNavigationDrawerController = AppNavigationDrawerController(rootViewController: navigationController,
                                                           leftViewController: leftHomeViewController,
                                                           rightViewController: rightViewController)
    
        return appNavigationDrawerController!
    }

}

