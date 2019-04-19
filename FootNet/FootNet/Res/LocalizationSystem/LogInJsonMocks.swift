//
//  LogInJsonMocks.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

func LogInJsonMocks(Email email:String, Password password: String) -> Data {
    switch email {
    case "anansadiya@gmail.com":
        let jsonResponseData = """
        [
            {
                "id": 1,
                "code": 1,
                "status": "OK"
            }
        ]
        """.data(using: .utf8)!
        return jsonResponseData
    default:
        let jsonResponseData = """
        [
            {
                "id": 0,
                "code": 2,
                "status": "ERROR"
            }
        ]
        """.data(using: .utf8)!
        return jsonResponseData
    }
}
