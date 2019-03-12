//
//  ValidateSignUpForm.swift
//  FootNet
//
//  Created by Anan Sadiya on 12/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class ValidateSignUpForm {
    
    var signUpFormErrors: String  = ""
    
    func CheckSignUpForm (userProfileModel: UserProfileModel) -> String {
        signUpFormErrors = ""
        signUpFormErrors += checkName(userProfileModel.name)
        signUpFormErrors += checkSurname(userProfileModel.surname)
        signUpFormErrors += checkPhone(userProfileModel.phone)
        signUpFormErrors += checkEmail(userProfileModel.email)
        
        return signUpFormErrors
    }
    
    private func checkName(_ name: String?) -> String {
        if name == nil {
            return "emptyName_error".localize()
        }
        let text = name!
        do {
            let regex = try NSRegularExpression(pattern: "^[A-Za-z\\t]{3,18}$", options: .caseInsensitive)
            let textRange = NSRange(location: 0, length: text.count)
            if regex.firstMatch(in: text, options: [], range: textRange) != nil {
                return ""
            } else {
                 return "invalidName_error".localize()
            }
        } catch  {
            return "invalidName_error".localize()
        }
    }
    
    private func checkSurname(_ surname: String?) -> String {
        if surname == nil {
            return "emptySurname_error".localize()
        }
        let text = surname!
        do {
            let regex = try NSRegularExpression(pattern: "^[A-Za-z\\t]{3,18}$", options: .caseInsensitive)
            let textRange = NSRange(location: 0, length: text.count)
            if regex.firstMatch(in: text, options: [], range: textRange) != nil {
                return ""
            } else {
                return "invalidSurname_error".localize()
            }
        } catch  {
            return "invalidSurname_error".localize()
        }
    }
    
    private func checkPhone(_ phone: String?) -> String {
        if phone == nil {
            return "emptyPhone_error".localize()
        }
        let text = phone!
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9+#*]{7,16}$", options: .caseInsensitive)
            let textRange = NSRange(location: 0, length: text.count)
            if regex.firstMatch(in: text, options: [], range: textRange) != nil {
                return ""
            } else {
                return "invalidPhone_error".localize()
            }
        } catch  {
            return "invalidPhone_error".localize()
        }
    }
    
    private func checkEmail(_ email: String?) -> String {
        if email == nil {
            return "emptyEmail_error".localize()
        }
        let text = email!
        do {
            let regex = try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive)
            let textRange = NSRange(location: 0, length: text.count)
            if regex.firstMatch(in: text, options: [], range: textRange) != nil {
                return ""
            } else {
                return "invalidEmail_error".localize()
            }
        } catch  {
             return "invalidEmail_error".localize()
        }
    }

}
