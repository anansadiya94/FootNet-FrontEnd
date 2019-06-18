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
        cofigureUserData()
        //Load all views
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
        setTabBar()
        addObservers()
    }
    
    private func cofigureUserData() {
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        StaticDBManager.shared.modifyUsers(userId: userId!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "   "
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
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.myPublicationsTapped), name: Notification.Name("myPublicationsTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.myFriendsTapped), name: Notification.Name("myFriendsTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.myContactsTapped), name: Notification.Name("myContactsTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarController.editProfileTapped), name: Notification.Name("editProfileTapped"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func myProfileTapped() {
        //TODO - PUSH My profile
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileViewController = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        profileViewController.userId = userId!
        profileViewController.viewProfileType = .MyProfile
        title = " "
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func editProfileTapped() {
        //TODO - PUSH Edit profile
        let editProfileStoryboard = UIStoryboard(name: "EditProfile", bundle: nil)
        let editProfileTableViewController = editProfileStoryboard.instantiateViewController(withIdentifier: "EditProfileTableViewController")
        title = " "
        navigationController?.pushViewController(editProfileTableViewController, animated: true)
    }
    
    @objc func myPublicationsTapped() {
        let myPublicationsStoryboard = UIStoryboard(name: "MyPublications", bundle: nil)
        let myPublicationsViewController = myPublicationsStoryboard.instantiateViewController(withIdentifier: "MyPublicationsViewController")
        title = " "
        navigationController?.pushViewController(myPublicationsViewController, animated: true)
    }
    
    @objc func myFriendsTapped() {
        let myFriendsStoryboard = UIStoryboard(name: "MyFriends", bundle: nil)
        let myFriendsViewController = myFriendsStoryboard.instantiateViewController(withIdentifier: "MyFriendsViewController")
        title = " "
        navigationController?.pushViewController(myFriendsViewController, animated: true)
    }
    
    @objc func myContactsTapped() {
        let myContactsStoryboard = UIStoryboard(name: "MyContacts", bundle: nil)
        let myContactsViewController = myContactsStoryboard.instantiateViewController(withIdentifier: "MyContactsViewController")
        title = " "
        navigationController?.pushViewController(myContactsViewController, animated: true)
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


