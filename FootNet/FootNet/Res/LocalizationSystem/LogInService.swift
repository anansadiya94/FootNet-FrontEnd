//
//  LogInService.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class LogInService {
    class func LogInAction(Email email: String, Password password: String) -> LogInResponseStruct {
        let logInRequestStruct = LogInRequestStruct(email: email, password: password)
        let encodedLogInRequest = try! JSONEncoder().encode(logInRequestStruct) 
        let logInResponseStruct = APIManager.LogInRequest(encodedLogInRequest)
        return logInResponseStruct
    }
}
