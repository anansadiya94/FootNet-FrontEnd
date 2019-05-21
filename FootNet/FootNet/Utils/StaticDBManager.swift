//
//  ConstantsManager.swift
//  FootNet
//
//  Created by Anan Sadiya on 20/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class StaticDBManager {
    
    static let shared = StaticDBManager()
    
    static var users = [
        User(id: 1, profileType: .Player, name: "Anan", surname: "Sadiya", email: "anansadiya@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "anan", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "73 kg", height: "178 cm", amIFollowing: true, active: true),
        User(id: 2, profileType: .Player, name: "Marcos", surname: "Molero Carrion", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 3, profileType: .Player, name: "Marti", surname: "Leonel Brude", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 4, profileType: .Player, name: "Salvador", surname: "Martin Valero", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 5, profileType: .Player, name: "Gustavo", surname: "Pirela Pasarella", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 6, profileType: .Player, name: "Sergi", surname: "Falcon Xarau", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 7, profileType: .Player, name: "Joan", surname: "Menendez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "joanet", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 8, profileType: .Player, name: "Eric", surname: "Torres Perramon", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: false, active: true),
        User(id: 9, profileType: .Player, name: "Dani", surname: "Sanchez", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 10, profileType: .Player, name: "Pau", surname: "Carreño", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 11, profileType: .Player, name: "Marc", surname: "Jordana", email: "marcos@gmail.com", phone: "12121212", sex: "male".localize(), birthday: "12/02/1990", nationality: "AFG".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "defaultProfilePhoto", bio: "Hola, soy el puto amo", record: "2010 barca", favoritePosition: "pos2".localize(), preferredPositions: "pos3".localize(), weight: "90 kg", height: "198 cm", amIFollowing: true, active: true),
        User(id: 12, profileType: .Player, name: "Thierry Daniel Henry", surname: "Tití", email: "henry@gmail.com", phone: "123456789", sex: "male".localize(), birthday: "17/08/1977", nationality: "FRA".localize(), location: "barcelona".localize(), actualClub: "ud_parc".localize(), photo: "henry", bio: "ex futbolista francés de ascendencia franco-antillana (Guadalupe y Martinica). Actualmente es entrenador y se encuentra sin equipo tras haber sido despedido por el A. S. Mónaco de la Ligue 1 de Francia.", record: "Juventus, Arsenal FC, FC Barcelona & New York RedBulls", favoritePosition: "pos2".localize(), preferredPositions: "pos2".localize(), weight: "90", height: "188", amIFollowing: true, active: false),
        User(id: 13, profileType: .Player, name: "Lionel", surname: "Andrés Messi Cuccittini", email: "messi@gmail.com", phone: "123456789", sex: "male".localize(), birthday: "24/06/1987", nationality: "ARG".localize(), location: "barcelona".localize(), actualClub: "fcb".localize(), photo: "messi", bio: "Soy un futbolista argentino que juega como delantero o centrocampista. Ha desarrollado toda su carrera en el F. C. Barcelona de la Primera División de España y en la selección argentina, de la que soy capitán. Soy el mejor del mundo vaya.", record: "FC Barcelona", favoritePosition: "pos10".localize(), preferredPositions: "pos2".localize(), weight: "72", height: "170", amIFollowing: true, active: true)
    ]
    
    static var textHomeCellsResponse = [
        TextHomeCellResponse(homeCellType: .Text, userId: 2, publicationId: 1, publicationText: "Mañana jugamos a las 12 en el campo de Marina, venid a vernos", publicationDate: "15-05-2019 23:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 1, reactionStatus: false), secondReactionCount: Reaction(reactionCount: 2, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 3, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 4, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 4, publicationId: 2, publicationText: "He marcado 3 goles hoy, que bueno soy", publicationDate: "06-05-2019 23:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 11, reactionStatus: false), secondReactionCount: Reaction(reactionCount: 23, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 54, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 22, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 5, publicationId: 3, publicationText: "Vaya golaso de Messi, D10S", publicationDate: "14-05-2019 23:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 7, reactionStatus: false), secondReactionCount: Reaction(reactionCount: 6, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 1, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 121, reactionStatus: false))),
        TextHomeCellResponse(homeCellType: .Text, userId: 10, publicationId: 4, publicationText: "Voy a ver el partido del Juvenil, a las 14 empieza! nos vemos ahí", publicationDate: "11-05-2019 23:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 33, reactionStatus: false), secondReactionCount: Reaction(reactionCount: 54, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 11, reactionStatus: false)))
    ]
    
    static var offerCellsResponse = [
        OfferCellResponse(homeCellType: .Offer, userId: 3, offerId: 1, offerTitle: "Se busca equipo en BCN", offerText: "Hola, soy Marcos, y busco un equipo en el centro", offerPhoto: "offerPhoto", publicationDate: "16-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested),
        OfferCellResponse(homeCellType: .Offer, userId: 5, offerId: 2, offerTitle: "Se busca equipo en Sabadell", offerText: "Hola, soy delantero, y busco un equipo en el centro de sabadell!", offerPhoto: "offerPhoto", publicationDate: "01-05-2019 23:59", offerRequested: false, offerStatus: .NotRequested)
    ]
    
    static var photoHomeCellsResponse = [
        PhotoHomeCellResponse(homeCellType: .Text, userId: 13, publicationId: 6, publicationPhoto: "photoPub1", publicationDate: "13-05-2019 14:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false),secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false))),
        PhotoHomeCellResponse(homeCellType: .Text, userId: 12, publicationId: 7, publicationPhoto: "photoPub2",  publicationDate: "02-05-2019 14:59", publicationReaction: PublicationReaction(firstReactionCount: Reaction(reactionCount: 13, reactionStatus: false), secondReactionCount: Reaction(reactionCount: 81, reactionStatus: false), thirdReactionCount: Reaction(reactionCount: 12, reactionStatus: false), fourthReactionCount: Reaction(reactionCount: 81, reactionStatus: false)))
    ]
    
    private init(){}
    
    func requestUsers() -> [User] {
        return StaticDBManager.users
    }
    
    func requestUsersBasicInfo() -> [DisplayUserBasicInfo] {
        var usersBasicInfo = [DisplayUserBasicInfo]()
        for user in StaticDBManager.users {
            let item = DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname, photo: user.photo, amIFollowing: user.amIFollowing)
            usersBasicInfo.append(item)
        }
        return usersBasicInfo
    }
    
    func requestOffers() -> [OfferCellResponse]  {
        return StaticDBManager.offerCellsResponse
    }
    
    func modifyOfferRequested (offerId: Int, offerRequested: Bool) {
        for offerCellResponse in StaticDBManager.offerCellsResponse {
            if offerId == offerCellResponse.offerId {
                var newOffer = offerCellResponse
                newOffer.offerRequested = offerRequested
                StaticDBManager.offerCellsResponse.removeAll(where: { $0.offerId == newOffer.offerId })
                StaticDBManager.offerCellsResponse.append(newOffer)
            }
        }
    }
    
    func requestTextPublications() -> [TextHomeCellResponse] {
        return StaticDBManager.textHomeCellsResponse
    }
    
    func requestPhotoPublications() -> [PhotoHomeCellResponse] {
        return StaticDBManager.photoHomeCellsResponse
    }
}

