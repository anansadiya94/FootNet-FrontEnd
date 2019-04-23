//
//  SignInService.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class SignInService {
    let apiManager = APIManager()
    func signInAction(email: String, password: String) -> SignInResponse {
        let signInRequest = SignInRequest(email: email, password: password)
        let signInResponse = apiManager.signInRequest(signInRequest)
        return signInResponse
    }
}
