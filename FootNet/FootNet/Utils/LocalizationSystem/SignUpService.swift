//
//  SignUpService.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class SignUpService {
    let apiManager = APIManager()
    func signUpAction(userProfileModel: UserProfileModel) -> SignUpResponse {
        let signUpRequest = SignUpRequest(userId: 0, name: userProfileModel.name, surname: userProfileModel.surname ?? "", email: userProfileModel.email, phone: userProfileModel.phone, password: userProfileModel.password, sex: userProfileModel.sex ?? "", birthday: userProfileModel.birthday ?? "", nationality: userProfileModel.nationality ?? "", location: userProfileModel.location, actualClub: userProfileModel.actualClub ?? "", photo: "PHOTO", bio: userProfileModel.bio ?? "", record: userProfileModel.record ?? "", favoritePosition: userProfileModel.favoritePosition ?? "", preferredPositions: userProfileModel.preferredPositions ?? "", weight: userProfileModel.weight ?? "", height: userProfileModel.height ?? "")
        let signUpResponse = apiManager.signUpRequest(signUpRequest)
        return signUpResponse
    }
}
