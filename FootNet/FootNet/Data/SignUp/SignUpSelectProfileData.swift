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
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: NSLocalizedString("player_label", comment: ""), type: .Player ),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: NSLocalizedString("coach_label", comment: ""), type: .Coach),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: NSLocalizedString("sportDirector_label", comment: ""), type: .SportDirector),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: NSLocalizedString("team_label", comment: ""), type: .Team),
            SignUpSelectProfileModel(img: #imageLiteral(resourceName: "logo") , title: NSLocalizedString("fan_label", comment: ""), type: .Fan)
        ]
        
        return signUpSelectProfileData
    }
}
