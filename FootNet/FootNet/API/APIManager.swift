//
//  APIManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct SignInRequest: Codable {
    let email, password: String
}

struct SignInResponse: Codable {
    let id, code: Int
    let status: String
}

struct SignUpRequest: Codable {
    let userId: Int
    let name: String
    let surname: String
    let email: String
    let phone: String
    let password: String
    let sex: String
    let birthday: String
    let nationality: String
    let location: String
    let actualClub: String
    let photo: String
    let bio: String
    let record: String
    let favoritePosition: String
    let preferredPositions: String
    let weight: String
    let height: String
}

struct SignUpResponse: Codable {
    let id, code: Int
    let status: String
}

enum HomeCellType {
    case Offer
    case Text
    case Photo
}

struct OfferCellResponse {
    let homeCellType: HomeCellType
    let userId: Int
    let offerId: Int
    let offerTitle: String
    let offerText: String
    let offerPhoto: String
    let publicationDate: String
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

class APIManager : ApiManagerProtocol {
    func signInRequest(_ signInRequest: SignInRequest) -> SignInResponse {
        let jsonResponseData = SignInJsonMocks(Email: signInRequest.email, Password: signInRequest.password)
        let decodedSignInResponse = try! JSONDecoder().decode([SignInResponse].self, from: jsonResponseData)
        return decodedSignInResponse.first!
    }
    
    func signUpRequest(_ signUpRequest: SignUpRequest) -> SignUpResponse {
        let jsonResponseData = SignUpJsonMocks(signUpRequest: signUpRequest)
        let decodedSignUpResponse = try! JSONDecoder().decode([SignUpResponse].self, from: jsonResponseData)
        return decodedSignUpResponse.first!
    }
}

protocol ApiManagerProtocol {
    func signInRequest(_ signInRequest: SignInRequest) -> SignInResponse
    func signUpRequest(_ signUpRequest: SignUpRequest) -> SignUpResponse
}
