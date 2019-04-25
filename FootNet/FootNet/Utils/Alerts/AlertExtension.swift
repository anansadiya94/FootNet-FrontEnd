//
//  AlertExtension.swift
//  FootNet
//
//  Created by Anan Sadiya on 24/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import Material

extension UIViewController {
    func showErrorMessageWithoutActionHandler(alertTitle: String, alertMessage: String, actionTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
