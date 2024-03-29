//
//  Common.swift
//  FootNet
//
//  Created by Anan Sadiya on 13/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct DisplayUserBasicInfo {
    let id: Int
    let fullName: String
    let photo: String
    var amIFollowing: Bool
}

struct Relationship {
    let followerId: Int
    let followingId: Int
}
