//
//  SignInJsonMocks.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

func SignInJsonMocks(Email email:String, Password password: String) -> Data {
    let isConnectedToNetwork = Reachability.isConnectedToNetwork()
    if (isConnectedToNetwork) {
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
        case "henry@gmail.com":
            let jsonResponseData = """
            [
                {
                    "id": 12,
                    "code": 1,
                    "status": "OK"
                }
            ]
            """.data(using: .utf8)!
            return jsonResponseData
        case "messi@gmail.com":
            let jsonResponseData = """
            [
                {
                    "id": 13,
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
                    "status": "USERNAME/PASSWORD ERROR"
                }
            ]
            """.data(using: .utf8)!
            return jsonResponseData
        }
    }
    else {
        let jsonResponseData = """
            [
                {
                    "id": 0,
                    "code": 3,
                    "status": "INTERNET CONNECTION ERROR"
                }
            ]
            """.data(using: .utf8)!
        return jsonResponseData
    }
}
