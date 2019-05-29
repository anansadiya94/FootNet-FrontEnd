//
//  APIRequest.swift
//  FootNet
//
//  Created by Anan Sadiya on 29/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct SignInRequest: Codable {
    let email, password: String
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
