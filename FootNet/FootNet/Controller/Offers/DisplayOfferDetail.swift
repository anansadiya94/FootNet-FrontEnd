//
//  DisplayOfferDetail.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct DisplayOfferDetail {
    let userId: Int
    let offerId: Int
    let fullName: String
    let photo: String
    let offerTitle: String
    let offerText: String
    let offerPhoto: String
    var offerRequested: Bool
    var offerStatus: OfferStatus
}
