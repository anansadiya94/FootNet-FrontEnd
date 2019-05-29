//
//  APIManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

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
