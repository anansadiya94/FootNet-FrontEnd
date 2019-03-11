//
//  UserProfileModel.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

struct UserProfileTags {
    let name = 0
    let surname = 1
    let phone = 2
    let email = 3
    let password = 4
    let repeatedPassword = 5
    
    let sex = 6
    let birthday = 7
    let nationality = 8
    let location = 9
    
    let actualClub = 10
    let photo = 11
    let bio = 12
    let record = 13
    
    let favoritePosition = 14
    let preferredPositions = 15
    let weight = 16
    let height = 17
}

class UserProfileModel {
    var token: String!
    var userId: Int!
    
    // personal information
    var name: String!
    var surname: String?
    var email: String!
    var phone: String!
    var password: String!
    var repeatedPassword: String!
    
    var sex: String?
    var birthday: String?
    var nationality: String?
    var location: String!
    
    var actualClub: String?
    var photo: String!
    var bio: String!
    var record: String!
    
    var favoritePosition: String?
    var preferredPositions: String?
    var weight: String?
    var height: String?
    
    init(token: String!, userId: Int!, name: String!, surname: String?, email: String!, phone: String!, password: String!, repeatedPassword: String!, sex: String?, birthday: String?, nationality: String?, location: String!, actualClub: String?, photo: String!, bio: String!, record: String!, favoritePosition: String?, preferredPositions: String?, weight: String?, height: String?) {
        self.token = token
        self.userId = userId
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
        self.repeatedPassword = repeatedPassword
        self.sex = sex
        self.birthday = birthday
        self.nationality = nationality
        self.location = location
        self.actualClub = actualClub
        self.photo = photo
        self.bio = bio
        self.record = record
        self.favoritePosition = favoritePosition
        self.preferredPositions = preferredPositions
        self.weight = weight
        self.height = height
    }
    
    init() {
//        self.name = ""
//        self.email = ""
//        self.phone = ""
//        self.password = ""
//        self.repeatedPassword = ""
//        self.sex = NSLocalizedString("male_sexPicker", comment: "")
//        self.birthday = "26/07/1994"
//        self.nationality = ""
//        self.location = ""
//        self.actualClub = ""
//        self.photo = ""
//        self.bio = ""
//        self.record = ""
//        self.favoritePosition = ""
//        self.preferredPositions = ""
//        self.weight = ""
//        self.height = ""
    }
}
