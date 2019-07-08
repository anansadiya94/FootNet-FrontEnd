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
    
    @IBOutlet weak var followView: UIStackView!
    @IBOutlet weak var followButton: CustomFollowButton!
    
    let lottieAnimation = LottieAnimation()
    var myId: Int = 0
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
    var amIFollowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        myId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
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
            title = "myProfileTitle".localize()
        case .RequestedProfile:
            title = "requestedProfileTitle".localize()
        case .VisitProfile:
            title = "searchedProfileTitle".localize()
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
            amIFollowing = user.amIFollowing
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
        configureFollowView()
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
        if amIFollowing {
            emailLabel.text = "email_label".localize() + userEmail
            emailLabel.textColor = UIColor.colorText
        } else {
            emailLabel.text = "email_label".localize() + "emailFollow_label".localize()
            emailLabel.textColor = .red
        }
    }
    
    private func configureUserPhone() {
        if amIFollowing {
            phoneLabel.text = "phone_label".localize() + userPhone
            phoneLabel.textColor = UIColor.colorText
        } else {
            phoneLabel.text = "phone_label".localize() + "phoneFollow_label".localize()
            phoneLabel.textColor = .red
        }
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
        heightLabel.text = "height_label".localize() + userHeight + " cm"
    }
    
    private func configureUserWeight() {
        weightLabel.text = "weight_label".localize() + userWeight + " kg"
    }
    
    private func configureUserActualClub() {
        actualClubLabel.text = "actualClub_label".localize() + userActualClub
    }
    
    private func configureUserFavoritePosition() {
        favoritePositionLabel.text = "favoritePosition_label".localize() + userFavoritePosition
    }
    
    private func configureUserBio() {
        bioLabel.text = "bio_label".localize() + userBio
        bioLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func configureUserRecord() {
        recordLabel.text = "record_label".localize() + userRecord
        recordLabel.adjustsFontSizeToFitWidth = true
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
        case .VisitProfile:
            requestView.isHidden = true
        }
        
        acceptRequestButton.setTitle("accept_button".localize(), for: .normal)
        rejectRequestButton.setTitle("reject_button".localize(), for: .normal)
    }
    
    private func configureFollowView() {
        switch viewProfileType {
        case .MyProfile:
            followView.isHidden = true
        case .RequestedProfile:
            followView.isHidden = true
        case .VisitProfile:
            followView.isHidden = false
        }
        CustomFollowButton.setup(followButton, amIFollowing)
    }
    
    @IBAction func acceptRequestButtonTapped(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            //_ = self.navigationController?.popViewController(animated: true)
            self.disableRequestButtons()
        }
    }
    
    @IBAction func rejectRequestButtonTapepd(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            //_ = self.navigationController?.popViewController(animated: true)
            self.disableRequestButtons()
        }
    }
    
    private func disableRequestButtons() {
        self.acceptRequestButton.isEnabled = false
        self.rejectRequestButton.isEnabled = false
    }
    
    @IBAction func followButtonTapped(_ sender: CustomFollowButton) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            StaticDBManager.shared.modifyFriends(followerId: self.myId, followingId: self.userId, followingStatus: !self.amIFollowing)
            CustomFollowButton.setup(self.followButton, !self.amIFollowing)
            self.generateUserInfo()
            self.configureUI()
        }
    }
}
