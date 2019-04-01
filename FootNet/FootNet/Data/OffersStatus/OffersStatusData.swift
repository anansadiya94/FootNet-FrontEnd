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
    static func getAcceptedOffersData() -> [OffersStatusModel] {
        var offersStatusData = [OffersStatusModel]()
        let acceptedOffersDetail = "acceptedOffers_detail".localize()
        offersStatusData = [
            OffersStatusModel(userImage: #imageLiteral(resourceName: "defaultProfilePhoto"), offerStatusDetail: "Default \(acceptedOffersDetail) 'se busca portero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "defaultProfilePhoto"), offerStatusDetail: "Default \(acceptedOffersDetail) 'se busca portero'.")
        ]
        return offersStatusData
    }
    
    static func getPendingOffersData() -> [OffersStatusModel] {
        var pendingStatusData = [OffersStatusModel]()
        let pendingOffersDetail = "pendingOffers_detail".localize()
        pendingStatusData = [
            OffersStatusModel(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "joanet"), offerStatusDetail: "Joan Menendez \(pendingOffersDetail) 'se busca portero'.")
        ]
        return pendingStatusData
    }
    
    static func getRejectedOffersData() -> [OffersStatusModel] {
        var rejectedStatusData = [OffersStatusModel]()
        let rejectedOffersDetail = "rejectedOffers_detail".localize()
        rejectedStatusData = [
            OffersStatusModel(userImage: #imageLiteral(resourceName: "homeRightImage"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "homeRightImage"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'."),
            OffersStatusModel(userImage: #imageLiteral(resourceName: "homeRightImage"), offerStatusDetail: "Anan Sadiya \(rejectedOffersDetail) 'se busca delantero'.")
        ]
        return rejectedStatusData
    }
}
