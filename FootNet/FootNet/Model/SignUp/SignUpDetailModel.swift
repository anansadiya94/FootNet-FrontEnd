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
    case NormalTextField
    case EmailTextField
    case PhoneTextField
    case PasswordTextField
    case DateTextField
}

struct SignUpDetailModel {
    let placeholder: String
    let type: CellType
}
