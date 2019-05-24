//
//  OffersStatusData.swift
//  FootNet
//
//  Created by Anan Sadiya on 01/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

class OffersStatusData {
    static func getAcceptedOffersData() -> [DisplayOfferStatusCell] {
        var offersStatusData = [DisplayOfferStatusCell]()
        let acceptedOffersDetail = "acceptedOffers_detail".localize()
        offersStatusData = [
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "defaultProfilePhoto"), offerStatusDetail: "Default \(acceptedOffersDetail) 'se busca portero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "defaultProfilePhoto"), offerStatusDetail: "Default \(acceptedOffersDetail) 'se busca portero'.")
        ]
        return offersStatusData
    }
    
    static func getPendingOffersData() -> [DisplayOfferStatusCell] {
        var pendingStatusData = [DisplayOfferStatusCell]()
        let pendingOffersDetail = "pendingOffers_detail".localize()
        pendingStatusData = [
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'.")
        ]
        return pendingStatusData
    }
    
    static func getRejectedOffersData() -> [DisplayOfferStatusCell] {
        var rejectedStatusData = [DisplayOfferStatusCell]()
        let rejectedOffersDetail = "rejectedOffers_detail".localize()
        rejectedStatusData = [
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "anan"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "anan"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'."),
            DisplayOfferStatusCell(userImage: #imageLiteral(resourceName: "anan"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'.")
        ]
        return rejectedStatusData
    }
}
