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
    
    static let nationality = ["AFG", "ALA", "ALB", "DZA", "ASM", "AND", "AGO", "AIA", "ATA", "ATG", "ARG", "ARM", "ABW", "AUS", "AUT", "AZE", "BHS", "BHR", "BGD", "BRB", "BLR", "BEL", "BLZ", "BEN", "BMU", "BTN", "BOL", "BES", "BIH", "BWA", "BVT", "BRA", "IOT", "BRN", "BGR", "BFA", "BDI", "CPV", "KHM", "CMR", "CAN", "CYM", "CAF", "TCD", "CHL", "CHN", "CXR", "CCK", "COL", "COM", "COG", "COD", "COK", "CRI", "CIV", "HRV", "CUB", "CUW", "CYP", "CZE", "DNK", "DJI", "DMA", "DOM", "ECU", "EGY", "SLV", "GNQ", "ERI", "EST", "SWZ", "ETH", "FLK", "FRO", "FJI", "FIN", "FRA", "GUF", "PYF", "ATF", "GAB", "GMB", "GEO", "DEU", "GHA", "GIB", "GRC", "GRL", "GRD", "GLP", "GUM", "GTM", "GGY", "GIN", "GNB", "GUY", "HTI", "HMD", "VAT", "HND", "HKG", "HUN", "ISL", "IND", "IDN", "IRN", "IRQ", "IRL", "IMN", "ISR", "ITA", "JAM", "JPN", "JEY", "JOR", "KAZ", "KEN", "KIR", "PRK", "KOR", "KWT", "KGZ", "LAO", "LVA", "LBN", "LSO", "LBR", "LBY", "LIE", "LTU", "LUX", "MAC", "MDG", "MWI", "MYS", "MDV", "MLI", "MLT", "MHL", "MTQ", "MRT", "MUS", "MYT", "MEX", "FSM", "MDA", "MCO", "MNG", "MNE", "MSR", "MAR", "MOZ", "MMR", "NAM", "NRU", "NPL", "NLD", "NCL", "NZL", "NIC", "NER", "NGA", "NIU", "NFK", "MKD", "MNP", "NOR", "OMN", "PAK", "PLW", "PSE", "PAN", "PNG", "PRY", "PER", "PHL", "PCN", "POL", "PRT", "PRI", "QAT", "REU", "ROU", "RUS", "RWA", "BLM", "SHN", "KNA", "LCA", "MAF", "SPM", "VCT", "WSM", "SMR", "STP", "SAU", "SEN", "SRB", "SYC", "SLE", "SGP", "SXM", "SVK", "SVN", "SLB", "SOM", "ZAF", "SGS", "SSD", "ESP", "LKA", "SDN", "SUR", "SJM", "SWE", "CHE", "SYR", "TWN", "TJK", "TZA", "THA", "TLS", "TGO", "TKL", "TON", "TTO", "TUN", "TUR", "TKM", "TCA", "TUV", "UGA", "UKR", "ARE", "GBR", "USA", "UMI", "URY", "UZB", "VUT", "VEN"]
    
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
    
    static let animationDelay = 1.0
    
    static var users = [
        User(id: 2, profileType: .Player, name: "Marcos", surname: "Molero Carrion", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true),
        User(id: 3, profileType: .Player, name: "Marti", surname: "Leonel Brude", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false),
        User(id: 4, profileType: .Player, name: "Salvador", surname: "Martin Valero", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true),
        User(id: 5, profileType: .Player, name: "Gustavo", surname: "Pirela Pasarella", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false),
        User(id: 6, profileType: .Player, name: "Sergi", surname: "Falcon Xarau", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false),
        User(id: 7, profileType: .Player, name: "Joan", surname: "Menendez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true),
        User(id: 8, profileType: .Player, name: "Eric", surname: "Torres Perramon", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false),
        User(id: 9, profileType: .Player, name: "Dani", surname: "Sanchez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true),
        User(id: 10, profileType: .Player, name: "Pau", surname: "Carreño", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true),
        User(id: 11, profileType: .Player, name: "Marc", surname: "Jordana", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true)
    ]
    
    static var usersBasicInfo : [DisplayUserBasicInfo] = {
        var usersBasicInfo = [DisplayUserBasicInfo]()
        for user in Constants.users {
            let item = DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname, photo: user.photo, amIFollowing: user.amIFollowing)
            usersBasicInfo.append(item)
        }
        return usersBasicInfo
    }()
    
    static var texHomeCellsResponse = [
        TexHomeCellResponse(homeCellType: .Text, userId: 2, publicationId: 1, publicationText: "Mañana jugamos a 12, venid a vernos",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 1, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 2, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 3, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 4, reactionStatus: false))),
        TexHomeCellResponse(homeCellType: .Text, userId: 4, publicationId: 2, publicationText: "He marcado 3 goles hoy, que bueno soy",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 11, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 23, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 54, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 22, reactionStatus: false))),
        TexHomeCellResponse(homeCellType: .Text, userId: 5, publicationId: 3, publicationText: "Vaya golaso de Messi, D10S",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 7, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 6, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 1, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 121, reactionStatus: false))),
        TexHomeCellResponse(homeCellType: .Text, userId: 2, publicationId: 4, publicationText: "holiuiii",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 33, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 54, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 11, reactionStatus: false))),
        TexHomeCellResponse(homeCellType: .Text, userId: 7, publicationId: 5, publicationText: "holiuasdasdiii",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false))),
    ]
}
