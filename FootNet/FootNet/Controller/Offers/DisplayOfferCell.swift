//
//  DisplayOfferCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 15/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct DisplayOffercell {
    let homeCellType: HomeCellType = .Offer
    let userId: Int
    let offerId: Int
    let fullName: String
    let photo: String
    let offerTitle: String
    let offerText: String
    let offerPhoto: String
    let publicationDate: Date
}
