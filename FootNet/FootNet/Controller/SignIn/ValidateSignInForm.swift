//
//  ValidateSignInForm.swift
//  FootNet
//
//  Created by Anan Sadiya on 14/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class ValidateSignInForm {
    var signInFormErrors: String  = ""
    let mailRegexp = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}${5,45}"
    
    func CheckSignInForm (Email email: String, Password password: String) -> String {
        signInFormErrors = ""
        signInFormErrors += checkEmail(email)
        signInFormErrors += checkPassword(password)
        return signInFormErrors
    }
    
    func checkEmail(_ email: String?) -> String {
        if email == "" {
            return "emptyEmail_error".localize()
        }
        let text = email!
        let regEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}${5,45}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            return ""
        }
        return "invalidEmail_error".localize()
    }
    
    private func checkPassword(_ password: String?) -> String {
        guard password != "" else { return "emptyPassword_error".localize() }
        let text = password!
        let regEx = "^(?=.{8,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).*${8,24}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            return ""
        }
        return "invalidPassword_error".localize()
    }
}
