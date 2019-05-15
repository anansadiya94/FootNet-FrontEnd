//
//  OfferTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 30/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerDetailLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        nameSurnameLabel.textColor = UIColor.colorText
        offerDetailLabel.textColor = UIColor.colorText
    }
    
    func setUp(img: String, fullName: String, offerImg: String, offerTitle: String) {
        userImageView.image = UIImage(named: img)
        nameSurnameLabel.text = fullName
        offerImageView.image = UIImage(named: offerImg)
        offerDetailLabel.text = offerTitle
        seeMoreButton.setTitle("seeMore_button".localize(), for: .normal)
    }
}
