//
//  OfferDetailViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 16/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerTitleLabel: CustomContentLabel!
    @IBOutlet weak var offerTextLabel: CustomContentLabel!
    @IBOutlet weak var offerRequestButton: CustomRequestButton!

    let lottieAnimation = LottieAnimation()
    var offerId: Int = 0
    var offerDetails = DisplayOfferDetail(userId: 0, offerId: 0, fullName: " ", photo: " ", offerTitle: " ", offerText: " ", offerPhoto: " ", offerRequested: false, offerStatus: OfferStatus.NotRequested)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        configureUI()
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
    }
    
    private func generateOfferDetails() -> DisplayOfferDetail? {
        for offerCellResponse in StaticDBManager.shared.requestOffers() {
            if offerId == offerCellResponse.offerId {
                if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == offerCellResponse.userId}).first {
                    return DisplayOfferDetail(userId: offerCellResponse.userId, offerId: offerCellResponse.offerId, fullName: user.fullName, photo: user.photo, offerTitle: offerCellResponse.offerTitle, offerText: offerCellResponse.offerText, offerPhoto: offerCellResponse.offerPhoto, offerRequested: offerCellResponse.offerRequested, offerStatus: offerCellResponse.offerStatus)
                }
            }
        }
        return nil
    }
    
    private func configureUI() {
        offerDetails = generateOfferDetails()!
        userImageView.image = UIImage(named: offerDetails.photo)
        fullNameLabel.text = offerDetails.fullName
        offerImageView.image = UIImage(named: offerDetails.offerPhoto)
        offerTitleLabel.text = offerDetails.offerTitle
        offerTextLabel.text = offerDetails.offerText
        CustomRequestButton.setup(offerRequestButton, offerDetails.offerRequested)
    }
    
    @IBAction func offerRequestButtonTapped(_ sender: CustomRequestButton) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            self.offerDetails.offerRequested = !self.offerDetails.offerRequested
            CustomRequestButton.setup(self.offerRequestButton, self.offerDetails.offerRequested)
            StaticDBManager.shared.modifyOfferRequested(offerId: self.offerId, offerRequested: self.offerDetails.offerRequested)
        }
    }
}

