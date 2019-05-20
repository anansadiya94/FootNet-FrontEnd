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
        User(id: 2, profileType: .Player, name: "Marcos", surname: "Molero Carrion", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 3, profileType: .Player, name: "Marti", surname: "Leonel Brude", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 4, profileType: .Player, name: "Salvador", surname: "Martin Valero", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 5, profileType: .Player, name: "Gustavo", surname: "Pirela Pasarella", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 6, profileType: .Player, name: "Sergi", surname: "Falcon Xarau", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 7, profileType: .Player, name: "Joan", surname: "Menendez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 8, profileType: .Player, name: "Eric", surname: "Torres Perramon", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 9, profileType: .Player, name: "Dani", surname: "Sanchez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 10, profileType: .Player, name: "Pau", surname: "Carreño", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 11, profileType: .Player, name: "Marc", surname: "Jordana", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 12, profileType: .Player, name: "Thierry Daniel Henry", surname: "Tití", email: "henry@gmail.com", phone: "123456789", sex: "male".localize(), birthday: "17/08/1977", nationality: "FRA".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "henry", bio: "ex futbolista francés de ascendencia franco-antillana (Guadalupe y Martinica). Actualmente es entrenador y se encuentra sin equipo tras haber sido despedido por el A. S. Mónaco de la Ligue 1 de Francia.", record: "Juventus, Arsenal FC, FC Barcelona & New York RedBulls", favoritePosition: "pos2".localize(), preferredPositions: "pos2".localize(), weight: "90", height: "188", amIFollowing: true, active: false),
        User(id: 13, profileType: .Player, name: "Lionel", surname: "Andrés Messi Cuccittini", email: "messi@gmail.com", phone: "123456789", sex: "male".localize(), birthday: "24/06/1987", nationality: "ARG".localize(), location: "barcelona".localize(), actualClub: "fcb".localize(), photo: "messi", bio: "Soy un futbolista argentino que juega como delantero o centrocampista. Ha desarrollado toda su carrera en el F. C. Barcelona de la Primera División de España y en la selección argentina, de la que soy capitán. Soy el mejor del mundo vaya.", record: "FC Barcelona", favoritePosition: "pos10".localize(), preferredPositions: "pos2".localize(), weight: "72", height: "170", amIFollowing: true, active: true)
    ]
    
    static var usersBasicInfo : [DisplayUserBasicInfo] = {
        var usersBasicInfo = [DisplayUserBasicInfo]()
        for user in Constants.users {
            let item = DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname, photo: user.photo, amIFollowing: user.amIFollowing)
            usersBasicInfo.append(item)
        }
        return usersBasicInfo
    }()
    
    static var textHomeCellsResponse = [
        TextHomeCellResponse(homeCellType: .Text, userId: 2, publicationId: 1, publicationText: "Mañana jugamos a 12, venid a vernos",
                            publicationDate: "15-05-2019 23:59",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 1, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 2, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 3, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 4, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 4, publicationId: 2, publicationText: "He marcado 3 goles hoy, que bueno soy",
                            publicationDate: "06-05-2019 23:59",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 11, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 23, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 54, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 22, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 5, publicationId: 3, publicationText: "Vaya golaso de Messi, D10S",
                            publicationDate: "14-05-2019 23:59",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 7, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 6, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 1, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 121, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 2, publicationId: 4, publicationText: "holiuiii",
                            publicationDate: "11-05-2019 23:59",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 33, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 54, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 11, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 7, publicationId: 5, publicationText: "holiuasdasdiii",
                            publicationDate: "13-05-2019 23:59",
                            publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false),
                                                                     secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false),
                                                                     thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                     fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false)))
    ]
    
    static var offerCellsResponse = [
        OfferCellResponse(homeCellType: .Offer, userId: 2, offerId: 1, offerTitle: "Se busca equipo en BCN", offerText: "Hola, soy Marcos, y busco un equipo en el centro", offerPhoto: "offerPhoto", publicationDate: "16-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested),
        OfferCellResponse(homeCellType: .Offer, userId: 5, offerId: 2, offerTitle: "Se busca equipo en Sabadell", offerText: "Hola, soy Gustavo, y busco un equipo en el centro de sabadell! llamadme", offerPhoto: "offerPhoto", publicationDate: "01-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested)
    ]
    
    static var photoHomeCellsResponse = [
        PhotoHomeCellResponse(homeCellType: .Text, userId: 7, publicationId: 6,
                              publicationPhoto: "joanet",
                              publicationDate: "13-05-2019 14:59",
                              publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false),
                                                                       secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false),
                                                                       thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                       fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false))),
        PhotoHomeCellResponse(homeCellType: .Text, userId: 9, publicationId: 7,
                              publicationPhoto: "joanet",
                              publicationDate: "02-05-2019 14:59",
                              publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false),
                                                                       secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false),
                                                                       thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false),
                                                                       fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false)))
    ]
}
