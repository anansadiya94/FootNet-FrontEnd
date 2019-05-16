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
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerTitleLabel: UILabel!
    @IBOutlet weak var offerTextLabel: UILabel!

    var offersViewController = OffersViewController()
    var displayOfferCells = [DisplayOffercell]()
    var userId: Int = 0
    var offerId: Int = 0
    var fullName: String = ""
    var photo: String = ""
    var offerPhoto: String = ""
    var offerTitle: String = ""
    var offerText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        displayOfferCells = offersViewController.generateDisplayOfferCells()
        configureUI()
    }
    
    private func configureUI() {
        userImageView.image = UIImage(named: photo)
        fullNameLabel.text = fullName
        fullNameLabel.textColor = UIColor.colorText
        offerImageView.image = UIImage(named: offerPhoto)
        offerTitleLabel.text = offerTitle
        offerTitleLabel.textColor = UIColor.colorText
        offerTextLabel.text = offerText
        offerTextLabel.textColor = UIColor.colorText
    }
}

