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
    
    func CheckSignInForm (Email email: String, Password password: String) -> String {
        signInFormErrors = ""
        signInFormErrors += checkEmail(email)
        signInFormErrors += checkPassword(password)
        
        return signInFormErrors
    }
    
    private func checkEmail(_ email: String?) -> String {
        guard email != "" else { return "emptyEmail_error".localize() }
        return ""
    }
    
    private func checkPassword(_ password: String?) -> String {
        guard password != "" else { return "emptyPassword_error".localize() }
        return ""
    }
}

