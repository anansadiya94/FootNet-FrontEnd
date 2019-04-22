//
//  SignInService.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class SignInService {
    class func SignInAction(Email email: String, Password password: String) -> SignInResponseStruct {
        let signInRequestStruct = SignInRequestStruct(email: email, password: password)
        let encodedSignInRequest = try! JSONEncoder().encode(signInRequestStruct) 
        let signInResponseStruct = APIManager.SignInRequest(encodedSignInRequest)
        return signInResponseStruct
    }
}
