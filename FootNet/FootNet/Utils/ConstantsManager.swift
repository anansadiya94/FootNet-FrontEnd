//
//  ConstantsManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class ConstantsManager {
    
    static let shared = ConstantsManager()
    
    static var offerCellsResponse = [
        OfferCellResponse(homeCellType: .Offer, userId: 2, offerId: 1, offerTitle: "Se busca equipo en BCN", offerText: "Hola, soy Marcos, y busco un equipo en el centro", offerPhoto: "offerPhoto", publicationDate: "16-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested),
        OfferCellResponse(homeCellType: .Offer, userId: 5, offerId: 2, offerTitle: "Se busca equipo en Sabadell", offerText: "Hola, soy Gustavo, y busco un equipo en el centro de sabadell! llamadme", offerPhoto: "offerPhoto", publicationDate: "01-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested)
    ]
    //Initializer access level change now
    private init(){}
    
    func requestOffers() -> [OfferCellResponse]  {
        return ConstantsManager.offerCellsResponse
    }
    
    func modifyOfferRequested (offerId: Int, offerRequested: Bool) {
        for offerCellResponse in ConstantsManager.offerCellsResponse {
            if offerId == offerCellResponse.offerId {
                var newOffer = offerCellResponse
                newOffer.offerRequested = offerRequested
                ConstantsManager.offerCellsResponse.removeAll(where: { $0.offerId == newOffer.offerId })
                ConstantsManager.offerCellsResponse.append(newOffer)
            }
        }
    }
}

