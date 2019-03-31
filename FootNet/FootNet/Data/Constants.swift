//
//  Constants.swift
//  FootNet
//
//  Created by Anan Sadiya on 07/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

struct Constants{
    static let sex = ["male", "female"]
    static let sexLocalized = sex.map({$0.localize()})
    
    static let nationality = ["ES", "IT", "FR"]
    static let nationalityLocalized = nationality.map({$0.localize()})
    
    static let location = ["barcelona", "santcugat", "sabadell"]
    static let locationLocalized = location.map({$0.localize()})
    
    static let actualClub = ["ud_parc", "atc", "fcb"]
    static let actualClubLocalized = actualClub.map({$0.localize()})
    
    static let favoritePosition = ["pos1", "pos2", "pos3", "pos4", "pos5", "pos6", "pos7", "pos8", "pos9", "pos10", "pos11"]
    static let favoritePositionLocalized = favoritePosition.map({$0.localize()})
    
    static let preferredPosition = ["pos1", "pos2", "pos3", "pos4", "pos5", "pos6", "pos7", "pos8", "pos9", "pos10", "pos11"]
    static let preferredPositionLocalized = preferredPosition.map({$0.localize()})
    
    static let weightLocalized = (40...140).map { String($0) + " kg" }
    static let heightLocalized = (150...240).map { String($0) + " cm" }
}
