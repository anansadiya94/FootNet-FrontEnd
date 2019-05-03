//
//  SignInService.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class SignInService: SignInServiceProtocol {
    private let apiManager = DependencyManager.resolve(interface: ApiManagerProtocol.self)
    func signInAction(email: String, password: String) -> SignInResponse {
        let signInRequest = SignInRequest(email: email, password: password)
        let signInResponse = apiManager!.signInRequest(signInRequest)
        return signInResponse
    }
}

protocol SignInServiceProtocol {
    func signInAction(email: String, password: String) -> SignInResponse
}
