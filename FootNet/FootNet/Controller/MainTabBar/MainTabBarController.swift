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
        let myProfileStoryboard = UIStoryboard(name: "MyProfile", bundle: nil)
        let myProfileViewController = myProfileStoryboard.instantiateViewController(withIdentifier: "MyProfileViewController")
        title = " "
        self.navigationController?.pushViewController(myProfileViewController, animated: true)
    }
    
    @objc func editProfileTapped() {
        //TODO - PUSH Edit profile
        let editProfileStoryboard = UIStoryboard(name: "EditProfile", bundle: nil)
        let editProfileViewController = editProfileStoryboard.instantiateViewController(withIdentifier: "EditProfleViewController")
        title = " "
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
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


