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

struct SignUpRequestStruct: Codable {
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

struct SignUpResponseStruct: Codable {
    let id, code: Int
    let status: String
}

class APIManager {
    func signInRequest(_ signInRequestStruct: SignInRequest) -> SignInResponse {
        let jsonResponseData = SignInJsonMocks(Email: signInRequestStruct.email, Password: signInRequestStruct.password)
        let decodedSignInResponse = try! JSONDecoder().decode([SignInResponse].self, from: jsonResponseData)
        return decodedSignInResponse.first!
    }
    
    func signUpRequest(_ signUpRequestStruct: SignUpRequestStruct) -> SignUpResponseStruct {
        let jsonResponseData = SignUpJsonMocks(SignUpRequestStruct: signUpRequestStruct)
        let decodedSignUpResponse = try! JSONDecoder().decode([SignUpResponseStruct].self, from: jsonResponseData)
        return decodedSignUpResponse.first!
    }
}
