//
//  UserProfileModel.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit
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
    var birthday: Date?
    var nationality: String?
    var location: String!
    
    var favoritePosition: String?
    var preferredPositions: [String]?
    var weight: Double?
    var height: Double?
    
    var actualClub: String?
    var photo: UIImage!
    var bio: String!
    var record: String!
    
    init(token: String!, userId: Int!, name: String!, surname: String?, email: String!, phone: String!, password: String!, repeatedPassword: String!, sex: String?, birthday: Date?, nationality: String?, location: String!, favoritePosition: String?, preferredPositions: [String]?, weight: Double?, height: Double?, actualClub: String?, photo: UIImage!, bio: String!, record: String!) {
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
        self.favoritePosition = favoritePosition
        self.preferredPositions = preferredPositions
        self.weight = weight
        self.height = height
        self.actualClub = actualClub
        self.photo = photo
        self.bio = bio
        self.record = record
    }
    
    init() {
    }
}
