//
//  DisplayPhotoHomeCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 15/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct DisplayPhotoHomeCell {
    let homeCellType: HomeCellType = .Photo
    let userId: Int
    let publicationId: Int
    let fullName: String
    let photo: String
    let publicationPhoto: String
    let publicationDate: String
    var publicationReaction: PublicationReaction
}
