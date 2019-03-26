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
    var validPassword: Bool = false
    var validRepeatPassword: Bool = false
    
    func CheckSignUpForm (UserProfileModel userProfileModel: UserProfileModel, ProfileType profileType: ProfileType) -> String {
        signUpFormErrors = ""
        signUpFormErrors += checkName(userProfileModel.name)
        signUpFormErrors += checkSurname(userProfileModel.surname, profileType)
        signUpFormErrors += checkPhone(userProfileModel.phone)
        signUpFormErrors += checkEmail(userProfileModel.email)
        signUpFormErrors += checkPassword(userProfileModel.password)
        signUpFormErrors += checkRepeatPassword(userProfileModel.repeatPassword)
        signUpFormErrors += checkRPasswordsMatch(userProfileModel.password, userProfileModel.repeatPassword)
        signUpFormErrors += checkSex(userProfileModel.sex, profileType)
        signUpFormErrors += checkBirthday(userProfileModel.birthday, profileType)
        signUpFormErrors += checkNationality(userProfileModel.nationality, profileType)
        signUpFormErrors += checkLocation(userProfileModel.location)
        signUpFormErrors += checkClubActual(userProfileModel.actualClub, profileType)
        signUpFormErrors += checkFavoritePosition(userProfileModel.favoritePosition, profileType)
        signUpFormErrors += checkPreferredPositions(userProfileModel.preferredPositions, profileType)
        signUpFormErrors += checkWeight(userProfileModel.weight, profileType)
        signUpFormErrors += checkHeight(userProfileModel.height, profileType)
        
        return signUpFormErrors
    }
    
    private func checkName(_ name: String?) -> String {
        guard name != nil else { return "emptyName_error".localize() }
        let text = name!
        let regEx = "^[A-zÀ-ú ]{3,18}$"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            return ""
        } else {
            return "invalidName_error".localize()
        }
    }
    
    private func checkSurname(_ surname: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Team:
            return ""
        default:
            if surname == nil {
                return "emptySurname_error".localize()
            }
            let text = surname!
            do {
                let regex = try NSRegularExpression(pattern: "^[A-zÀ-ú ]{3,18}$", options: .caseInsensitive)
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
    }
    
    private func checkPhone(_ phone: String?) -> String {
//        if phone == nil {
//            return "emptyPhone_error".localize()
//        }
//        let text = phone!
//        do {
//            let regex = try NSRegularExpression(pattern: "^[0-9+#*]{7,16}$", options: .caseInsensitive)
//            let textRange = NSRange(location: 0, length: text.count)
//            if regex.firstMatch(in: text, options: [], range: textRange) != nil {
//                return ""
//            } else {
//                return "invalidPhone_error".localize()
//            }
//        } catch  {
//            return "invalidPhone_error".localize()
//        }
        //2
        guard phone != nil else { return "emptyPhone_error".localize() }
        let text = phone!
        let regEx = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            return ""
        } else {
            return "invalidPhone_error".localize()
        }
    }
    
    private func checkEmail(_ email: String?) -> String {
        if email == nil {
            return "emptyEmail_error".localize()
        }
        let text = email!
        do {
            let regex = try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}${5,45}", options: .caseInsensitive)
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
    
    private func checkPassword(_ password: String?) -> String {
        guard password != nil else { return "emptyPassword_error".localize() }
        let text = password!
        let regEx = "^(?=.{8,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).*${8,24}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            validPassword = true
            return ""
        } else {
            return "invalidPassword_error".localize()
        }
    }
    
    private func checkRepeatPassword(_ repeatPassword: String?) -> String {
        guard repeatPassword != nil else { return "emptyRepeatPassword_error".localize() }
        let text = repeatPassword!
        let regEx = "^(?=.{8,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).*${8,24}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        if pred.evaluate(with: text) {
            validRepeatPassword = true
            return ""
        } else {
            return "invalidRepeatPassword_error".localize()
        }
    }
    
    private func checkRPasswordsMatch(_ password: String?, _ repeatPassword: String?) -> String {
        if (validPassword && validRepeatPassword) {
            if (password == repeatPassword) {
                return ""
            } else {
                return "matchPasswords_error".localize()
            }
        }
        return ""
    }
    
    private func checkSex(_ sex: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Team:
            return ""
        default:
            if sex == nil {
                return "emptySex_error".localize()
            }
        }
        return ""
    }
    
    private func checkBirthday(_ birthday: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Team:
            return ""
        default:
            if birthday == nil {
                return "emptyBirthday_error".localize()
            }
        }
        return ""
    }
    
    private func checkNationality(_ nationality: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Team:
            return ""
        default:
            if nationality == nil {
                return "emptyNationality_error".localize()
            }
        }
        return ""
    }
    
    private func checkLocation(_ Location: String?) -> String {
        if Location == nil {
            return "emptyLocation_error".localize()
        }
        return ""
    }
    
    private func checkClubActual(_ clubActual: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Team:
            return ""
        default:
            if clubActual == nil {
                return "emptyClubActual_error".localize()
            }
        }
        return ""
    }
    
    private func checkFavoritePosition(_ favoritePosition: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Player:
            if favoritePosition == nil {
                return "emptyFavoritePosition_error".localize()
            }
        default:
            return ""
        }
        return ""
    }
    
    private func checkPreferredPositions(_ preferredPositions: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Player:
            if preferredPositions == nil {
                return "emptyPreferredPositions_error".localize()
            }
        default:
            return ""
        }
        return ""
    }
    
    private func checkWeight(_ weight: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Player:
            if weight == nil {
                return "emptyWeight_error".localize()
            }
        default:
            return ""
        }
        return ""
    }
    
    private func checkHeight(_ height: String?, _ profileType: ProfileType) -> String {
        switch profileType {
        case .Player:
            if height == nil {
                return "emptyHeight_error".localize()
            }
        default:
            return ""
        }
        return ""
    }
}
