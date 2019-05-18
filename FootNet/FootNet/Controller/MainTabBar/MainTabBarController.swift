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
    @IBOutlet weak var searchTabBar: UITabBar!
    @IBOutlet weak var offersStatusTab: UITabBar!
    @IBOutlet weak var notificationsTabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Load all views
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
        setTabBar()
        addObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "FootNet"
    }
    
    private func setTabBar() {
        tabBar.barTintColor = UIColor.colorBars
        homeTabBar.tintColor = UIColor.colorSecondary
        homeTabBar.unselectedItemTintColor = UIColor.colorText
        offerTabBar.tintColor = UIColor.colorSecondary
        offerTabBar.unselectedItemTintColor = UIColor.colorText
        searchTabBar.tintColor = UIColor.colorSecondary
        searchTabBar.unselectedItemTintColor = UIColor.colorText
        offersStatusTab.tintColor = UIColor.colorSecondary
        offersStatusTab.unselectedItemTintColor = UIColor.colorText
        notificationsTabBar.tintColor = UIColor.colorSecondary
        notificationsTabBar.unselectedItemTintColor = UIColor.colorText
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.signOutTapped), name: Notification.Name("signOutTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.deactivateAccountTapped), name: Notification.Name("deactivateAccountTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.myProfileTapped), name: Notification.Name("myProfileTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.editProfileTapped), name: Notification.Name("editProfileTapped"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func myProfileTapped() {
        //TODO - GET -> Profile detail
        //TODO - PUSH My profile
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileViewController = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController")
        title = " "
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func editProfileTapped() {
        //TODO - PUSH Edit profile
        let editProfileStoryboard = UIStoryboard(name: "EditProfile", bundle: nil)
        let editProfileViewController = editProfileStoryboard.instantiateViewController(withIdentifier: "EditProfleViewController")
        title = " "
        navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    
    @objc func signOutTapped() {
        //TODO - Close session!
        let signInStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let signInViewController = signInStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInViewController, animated: true, completion: nil)
    }
    
    @objc func deactivateAccountTapped() {
        //TODO - POST -> Deactivate account
        let signInStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let signInViewController = signInStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInViewController, animated: true, completion: nil)
    }
}


