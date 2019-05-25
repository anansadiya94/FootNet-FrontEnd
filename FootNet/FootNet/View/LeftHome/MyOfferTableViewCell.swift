//
//  MyOfferTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyOfferTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerDetailLabel: CustomContentLabel!
    @IBOutlet weak var offerTextLabel: CustomContentLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(offerId: Int, img: String, fullName: String, offerImg: String, offerTitle: String, offerText: String) {
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        offerImageView.image = UIImage(named: offerImg)
        offerDetailLabel.text = offerTitle
        offerTextLabel.text = offerText
    }
}
