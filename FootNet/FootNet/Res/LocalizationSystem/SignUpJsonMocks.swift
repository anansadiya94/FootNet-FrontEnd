//
//  SignUpJsonMocks.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

func SignUpJsonMocks(SignUpRequestStruct signUpRequestStruct:SignUpRequestStruct) -> Data {
    let isConnectedToNetwork = Reachability.isConnectedToNetwork()
    if (isConnectedToNetwork) {
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
    } else {
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
