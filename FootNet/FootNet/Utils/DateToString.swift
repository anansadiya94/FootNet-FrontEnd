//
//  DateToString.swift
//  FootNet
//
//  Created by Anan Sadiya on 29/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String = "dd-MM-yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
