//
//  DisplayTextHomeCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 13/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct DisplayTextHomeCell {
    let homeCellType: HomeCellType
    let userId: Int
    let publicationId: Int
    let fullName: String
    let photo: String
    let publicationText: String
    let publicationDate: Date
    var publicationReaction: PublicationReaction
}

struct PublicationReaction {
    var firstReactionCount: Reaction
    var secondReactionCount: Reaction
    var thirdReactionCount: Reaction
    var fourthReactionCount: Reaction
}

struct Reaction {
    var reactionCount: Int
    var reactionStatus: Bool
}



