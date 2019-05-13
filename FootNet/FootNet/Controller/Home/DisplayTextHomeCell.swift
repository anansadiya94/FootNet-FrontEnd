//
//  DisplayTextHomeCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 13/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
struct TexHomeCellResponse {
    let id: Int
    let publicationText: String
    var publicationReaction: PublicationReaction
}

struct DisplayTextHomeCell {
    let id: Int
    let fullName: String
    let photo: String
    let publicationText: String
    var publicationReaction: PublicationReaction
}

struct PublicationReaction {
    var firstReactionCount: Int
    var secondReactionCount: Int
    var thirdReactionCount: Int
    var fourthReactionCount: Int
}

struct DisplayUserInfo {
    let id: Int
    let fullName: String
    let photo: String
}

