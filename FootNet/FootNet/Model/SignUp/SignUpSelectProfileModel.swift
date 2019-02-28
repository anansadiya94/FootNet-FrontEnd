//
//  SignUpModel.swift
//  FootNet
//
//  Created by Anan Sadiya on 28/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

enum ProfileType {
    case Player
    case Coach
    case SportDirector
    case Team
    case Fan
}

struct SignUpSelectProfileModel {
    let img: UIImage
    let title: String
    let type: ProfileType
}
