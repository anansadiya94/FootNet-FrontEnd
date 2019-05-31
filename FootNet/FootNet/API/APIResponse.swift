//
//  APIResponse.swift
//  FootNet
//
//  Created by Anan Sadiya on 29/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct SignInResponse: Codable {
    let id, code: Int
    let status: String
}

struct SignUpResponse: Codable {
    let id, code: Int
    let status: String
}

enum HomeCellType {
    case Text
    case Photo
    case Offer
}

struct TextHomeCellResponse {
    let homeCellType: HomeCellType
    let userId: Int
    let publicationId: Int
    let publicationText: String
    let publicationDate: String
    var publicationReaction: PublicationReaction
}

struct PhotoHomeCellResponse {
    let homeCellType: HomeCellType
    let userId: Int
    let publicationId: Int
    let publicationPhoto: String
    let publicationDate: String
    var publicationReaction: PublicationReaction
}

struct OfferCellResponse {
    let homeCellType: HomeCellType
    let userId: Int
    let offerId: Int
    let offerTitle: String
    let offerText: String
    let offerPhoto: String
    let publicationDate: String
    var offerRequested: Bool
    var offerStatus: OfferStatus
}

enum OfferStatus {
    case NotRequested
    case Accepted
    case Pending
    case Rejected
}

enum NotificationCellType {
    case Text
    case Photo
    case Offer
}

struct NotificationCellResponse {
    let notificationCellType: NotificationCellType
    let userId: Int
}
