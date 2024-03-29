//
//  AppNavigationDrawerRouter.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import Material

extension AppNavigationDrawer: AppNavigationDrawerDelegate {
    func closeLeftView() {
        appNavigationDrawerController?.closeLeftView()
    }
    
    func closeRightView() {
        appNavigationDrawerController?.closeRightView()
    }
}

class AppNavigationDrawer: UIViewController {
    var appNavigationDrawerController: AppNavigationDrawerController?
    
    func createAppNavigationDrawer () -> AppNavigationDrawerController {
        let mainViewController: MainTabBarController = {
            let viewController = UIStoryboard.viewController(name: "MainTabBar", identifier: "MainTabBarController") as! MainTabBarController
            return viewController
        }()
        
        let leftHomeTableViewController: LeftHomeTableViewController = {
            let viewController = UIStoryboard.viewController(name: "LeftHome", identifier: "LeftHomeTableViewController") as! LeftHomeTableViewController
            viewController.delegate = self
            return viewController
        }()
        
        let rightViewController: PublishTableViewController = {
            let viewController = UIStoryboard.viewController(name: "Publish", identifier: "PublishTableViewController") as! PublishTableViewController
            viewController.delegate = self
            return viewController
        }()
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        setNavigationBar(navigationController)
        setHomeLeftButton(mainViewController)
        setHomeRightButton(mainViewController)
        navigationController.navigationBar.tintColor = UIColor.colorText
        let backItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationController.navigationItem.backBarButtonItem = backItem
        appNavigationDrawerController?.navigationItem.backBarButtonItem = backItem
        appNavigationDrawerController = AppNavigationDrawerController(rootViewController: navigationController,
                                                           leftViewController: leftHomeTableViewController,
                                                           rightViewController: rightViewController)
    
        return appNavigationDrawerController!
    }
    
    private func setNavigationBar(_ navigationController: UINavigationController) {
        navigationController.navigationBar.topItem?.title = "FootNet"
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.colorText]
        navigationController.navigationBar.barTintColor = UIColor.colorBars
    }
    
    private func setHomeLeftButton(_ viewController: UIViewController) {
        let homeLeftButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(homeLeftTapped))
        homeLeftButtonItem.tintColor = UIColor.colorText
        viewController.navigationItem.leftBarButtonItem = homeLeftButtonItem
    }
    
    private func setHomeRightButton(_ viewController: UIViewController) {
        let homeRightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(homeRightTapped))
        homeRightButtonItem.customView?.tintColor = UIColor.colorText
        viewController.navigationItem.rightBarButtonItem = homeRightButtonItem
    }
    
    @objc private func homeLeftTapped(_ sender: Any) {
        appNavigationDrawerController?.openLeftView()
    }
    
    @objc private func homeRightTapped(_ sender: Any) {
        appNavigationDrawerController?.openRightView()
    }
}

