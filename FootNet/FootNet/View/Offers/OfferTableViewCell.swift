//
//  OfferTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 30/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol OfferCellDelegate : class {
    func seeMoreButtonTapped(offerId: Int)
}

class OfferTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerDetailLabel: CustomContentLabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    weak var offerCellDelegate : OfferCellDelegate?
    
    var offerIdD: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(offerId: Int, img: String, fullName: String, offerImg: String, offerTitle: String, offerCellDelegate : OfferCellDelegate) {
        offerIdD = offerId
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        offerImageView.image = UIImage(named: offerImg)
        offerDetailLabel.text = offerTitle
        seeMoreButton.setTitle("seeMore_button".localize(), for: .normal)
        self.offerCellDelegate = offerCellDelegate
    }
    
    @IBAction func SeeMoreButtonTapped(_ sender: Any) {
        offerCellDelegate?.seeMoreButtonTapped(offerId: offerIdD)
    }
}
