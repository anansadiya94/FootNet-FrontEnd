//
//  APIManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct LogInRequestStruct: Codable {
    let email, password: String
}

struct LogInResponseStruct: Codable {
    let id, code: Int
    let status: String
}

class APIManager {
    class func LogInRequest(_ jsonRequestData: Data) -> LogInResponseStruct {
        let decodedLogInRequest = try! JSONDecoder().decode(LogInRequestStruct.self, from: jsonRequestData)
        let jsonResponseData = LogInJsonMocks(Email: decodedLogInRequest.email, Password: decodedLogInRequest.password)
        let decodedLogInResponse = try! JSONDecoder().decode([LogInResponseStruct].self, from: jsonResponseData)
        return decodedLogInResponse.first!
    }
}
