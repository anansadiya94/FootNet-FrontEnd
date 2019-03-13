//
//  SignUpData.swift
//  FootNet
//
//  Created by Anan Sadiya on 28/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

class SignUpSelectProfileData {
    
    static func getAllSignUpSelectProfileData() -> [SignUpSelectProfileModel] {
        
        var signUpSelectProfileData = [SignUpSelectProfileModel]()
        
        signUpSelectProfileData = [
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: "player_label".localize(), type: .Player ),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: "coach_label".localize(), type: .Coach),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: "sportDirector_label".localize(), type: .SportDirector),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: "team_label".localize(), type: .Team),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: "fan_label".localize(), type: .Fan)
        ]
        
        return signUpSelectProfileData
    }
}
