//
//  APIManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct SignInRequestStruct: Codable {
    let email, password: String
}

struct SignInResponseStruct: Codable {
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
    class func SignInRequest(_ jsonRequestData: Data) -> SignInResponseStruct {
        let decodedSignInRequest = try! JSONDecoder().decode(SignInRequestStruct.self, from: jsonRequestData)
        let jsonResponseData = SignInJsonMocks(Email: decodedSignInRequest.email, Password: decodedSignInRequest.password)
        let decodedSignInResponse = try! JSONDecoder().decode([SignInResponseStruct].self, from: jsonResponseData)
        return decodedSignInResponse.first!
    }
    
    class func SignUpRequest(_ jsonRequestData: Data) -> SignUpResponseStruct {
        let decodedSignUpRequest = try! JSONDecoder().decode(SignUpRequestStruct.self, from: jsonRequestData)
        let jsonResponseData = SignUpJsonMocks(SignUpRequestStruct: decodedSignUpRequest)
        let decodedSignUpResponse = try! JSONDecoder().decode([SignUpResponseStruct].self, from: jsonResponseData)
        return decodedSignUpResponse.first!
    }
}
