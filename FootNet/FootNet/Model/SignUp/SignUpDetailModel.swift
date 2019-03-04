//
//  SignUpDetailModel.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

enum CellType {
    case TextField
    case PasswordTextField
    case Number
}

struct SignUpDetailModel {
    let placeholder: String
    let type: CellType
}
