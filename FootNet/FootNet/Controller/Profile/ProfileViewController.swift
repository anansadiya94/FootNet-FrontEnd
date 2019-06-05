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
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var profileTypeLabel: CustomContentLabel!
    @IBOutlet weak var emailLabel: CustomContentLabel!
    @IBOutlet weak var phoneLabel: CustomContentLabel!
    @IBOutlet weak var sexLabel: CustomContentLabel!
    @IBOutlet weak var birthdayLabel: CustomContentLabel!
    @IBOutlet weak var nationalityLabel: CustomContentLabel!
    @IBOutlet weak var locationLabel: CustomContentLabel!
    @IBOutlet weak var heightLabel: CustomContentLabel!
    @IBOutlet weak var weightLabel: CustomContentLabel!
    @IBOutlet weak var actualClubLabel: CustomContentLabel!
    @IBOutlet weak var favoritePositionLabel: CustomContentLabel!
    @IBOutlet weak var bioLabel: CustomContentLabel!
    @IBOutlet weak var recordLabel: CustomContentLabel!
    @IBOutlet weak var requestView: UIStackView!
    @IBOutlet weak var acceptRequestButton: CustomAcceptButton!
    @IBOutlet weak var rejectRequestButton: CustomRejectButton!
    
    let lottieAnimation = LottieAnimation()
    var userId: Int = 0
    var viewProfileType: ViewProfileType = .MyProfile
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
    var userActualClub: String = ""
    var userFavoritePosition: String = ""
    var userBio: String = ""
    var userRecord: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        generateUserInfo()
        configureUI()
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
    }
    
    private func setTabBarItem() {
        switch viewProfileType {
        case .MyProfile:
            title = "myProfileLabel".localize()
        default:
            title = ""
        }
    }
    
    private func generateUserInfo() {
        if let user = StaticDBManager.shared.requestUsers().filter({$0.id == userId}).first {
            userPhoto = user.photo
            userFullName = user.name + " " + user.surname
            userProfileType = user.profileType
            userEmail = user.email
            userPhone = user.phone
            userSex = user.sex
            userBirthday = user.birthday
            userNationality = user.nationality
            userLocation = user.location
            userHeight = user.height
            userWeight = user.weight
            userActualClub = user.actualClub
            userFavoritePosition = user.favoritePosition
            userBio = user.bio
            userRecord = user.record
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
        configureUserActualClub()
        configureUserFavoritePosition()
        configureUserBio()
        configureUserRecord()
        configureRequestView()
    }
    
    private func configureUserPhoto() {
        profilePhotoImageView.image = UIImage(named: userPhoto)
    }
    
    private func configureUserFullName() {
        fullNameLabel.text = userFullName
    }
    
    private func configureUserProfileType() {
        profileTypeLabel.text = profileTypeToString(profileType: userProfileType)
    }
    
    private func configureUserEmail() {
        emailLabel.text = "email_label".localize() + userEmail
    }
    
    private func configureUserPhone() {
        phoneLabel.text = "phone_label".localize() + userPhone
    }
    
    private func configureUserSex() {
        sexLabel.text = "sex_label".localize() + userSex
    }
    
    private func configureUserBirthday() {
        birthdayLabel.text = "birthday_label".localize() + userBirthday
    }
    
    private func configureUserNationality() {
        nationalityLabel.text = "nationality_label".localize() + userNationality
    }
    
    private func configureUserLocation() {
        locationLabel.text = "location_label".localize() + userLocation
    }
    
    private func configureUserHeight() {
        heightLabel.text = "height_label".localize() + userHeight + "cm"
    }
    
    private func configureUserWeight() {
        weightLabel.text = "weight_label".localize() + userWeight + "kg"
    }
    
    private func configureUserActualClub() {
        actualClubLabel.text = "actualClub_label".localize() + userActualClub
    }
    
    private func configureUserFavoritePosition() {
        favoritePositionLabel.text = "favoritePosition_label".localize() + userFavoritePosition
    }
    
    private func configureUserBio() {
        bioLabel.text = "bio_label".localize() + userBio
    }
    
    private func configureUserRecord() {
        recordLabel.text = "record_label".localize() + userRecord
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
    
    private func configureRequestView() {
        switch viewProfileType {
        case .MyProfile:
            requestView.isHidden = true
        case .RequestedProfile:
            requestView.isHidden = false
        }
        
        acceptRequestButton.setTitle("Accept", for: .normal)
        rejectRequestButton.setTitle("Reject", for: .normal)
    }
    
    
    @IBAction func acceptRequestButtonTapped(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func rejectRequestButtonTapepd(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
