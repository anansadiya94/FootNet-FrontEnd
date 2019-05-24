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
    static func getAllSignUpSelectProfileData() -> [DisplaySignUpSelectProfileCell] {
        var signUpSelectProfileData = [DisplaySignUpSelectProfileCell]()
        signUpSelectProfileData = [
            DisplaySignUpSelectProfileCell(img: #imageLiteral(resourceName: "logo") , title: "player_label".localize(), type: .Player ),
            DisplaySignUpSelectProfileCell(img: #imageLiteral(resourceName: "logo") , title: "coach_label".localize(), type: .Coach),
            DisplaySignUpSelectProfileCell(img: #imageLiteral(resourceName: "logo") , title: "sportDirector_label".localize(), type: .SportDirector),
            DisplaySignUpSelectProfileCell(img: #imageLiteral(resourceName: "logo") , title: "team_label".localize(), type: .Team),
            DisplaySignUpSelectProfileCell(img: #imageLiteral(resourceName: "logo") , title: "fan_label".localize(), type: .Fan)
        ]
        return signUpSelectProfileData
    }
}
