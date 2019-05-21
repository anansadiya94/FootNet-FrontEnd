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

    var offerId: Int = 0
    var offerDetails = DisplayOfferDetail(userId: 0, offerId: 0, fullName: " ", photo: " ", offerTitle: " ", offerText: " ", offerPhoto: " ", offerRequested: false, offerStatus: OfferStatus.NotRequested)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        configureUI()
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
        offerDetails.offerRequested = !offerDetails.offerRequested
        CustomRequestButton.setup(offerRequestButton, offerDetails.offerRequested)
        StaticDBManager.shared.modifyOfferRequested(offerId: offerId, offerRequested: offerDetails.offerRequested)
    }
}

