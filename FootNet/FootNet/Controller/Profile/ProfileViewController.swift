//
//  ProfileViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 17/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profilePhotoImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var profileTypeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var userPhoto: String = ""
    var userFullName: String = ""
    var userProfileType: ProfileType = .Player
    var userEmail: String = ""
    var userPhone: String = ""
    var userSex: String = ""
    var userBirthday: String = ""
    var userNationality: String = ""
    var userLocation: String = ""
    var userHeight: String = ""
    var userWeight: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        generateUserInfo()
        configureUI()
    }
    
    private func setTabBarItem() {
        title = "editProfileLabel".localize()
    }
    
    private func generateUserInfo() {
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        if let user = Constants.users.filter({$0.id == userId}).first {
            userPhoto = user.photo
            userFullName = user.name + " " + userFullName
            userProfileType = user.profileType
            userEmail = user.email
            userPhone = user.phone
            userSex = user.sex
            userBirthday = user.birthday
            userNationality = user.nationality
            userLocation = user.location
            userHeight = user.height
            userWeight = user.weight
        }
    }
    
    private func configureUI() {
        configureUserPhoto()
        configureUserFullName()
        configureUserProfileType()
        configureUserEmail()
        configureUserPhone()
        configureUserSex()
        configureUserBirthday()
        configureUserNationality()
        configureUserLocation()
        configureUserHeight()
        configureUserWeight()
    }
    
    private func configureUserPhoto() {
        profilePhotoImageView.image = UIImage(named: userPhoto)
    }
    
    private func configureUserFullName() {
        fullNameLabel.text = userFullName
        fullNameLabel.textColor = UIColor.colorText
    }
    
    private func configureUserProfileType() {
        profileTypeLabel.text = profileTypeToString(profileType: userProfileType)
        profileTypeLabel.textColor = UIColor.colorText
    }
    
    private func configureUserEmail() {
        emailLabel.text = "email_label".localize() + userEmail
        emailLabel.textColor = UIColor.colorText
    }
    
    private func configureUserPhone() {
        phoneLabel.text = "phone_label".localize() + userPhone
        phoneLabel.textColor = UIColor.colorText
    }
    
    private func configureUserSex() {
        sexLabel.text = "sex_label".localize() + userSex
        sexLabel.textColor = UIColor.colorText
    }
    
    private func configureUserBirthday() {
        birthdayLabel.text = "birthday_label".localize() + userBirthday
        birthdayLabel.textColor = UIColor.colorText
    }
    
    private func configureUserNationality() {
        nationalityLabel.text = "nationality_label".localize() + userNationality
        nationalityLabel.textColor = UIColor.colorText
    }
    
    private func configureUserLocation() {
        locationLabel.text = "location_label".localize() + userLocation
        locationLabel.textColor = UIColor.colorText
    }
    
    private func configureUserHeight() {
        heightLabel.text = "height_label".localize() + userHeight + "cm"
        heightLabel.textColor = UIColor.colorText
    }
    
    private func configureUserWeight() {
        weightLabel.text = "weight_label".localize() + userWeight + "kg"
        weightLabel.textColor = UIColor.colorText
    }
    
    private func profileTypeToString (profileType: ProfileType) -> String {
        switch profileType {
        case .Player:
            return "player_label".localize()
        case .Coach:
            return "coach_label".localize()
        case .SportDirector:
            return "sportDirector_label".localize()
        case .Team:
            return "team_label".localize()
        case .Fan:
            return "fan_label".localize()
        }
    }
}
