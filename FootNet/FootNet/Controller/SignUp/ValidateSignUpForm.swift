//
//  ValidateSignUpForm.swift
//  FootNet
//
//  Created by Anan Sadiya on 12/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation

class ValidateSignUpForm {
    
    var signUpFormErrors: String = ""
    
    func CheckSignUpForm (userProfileModel: UserProfileModel) -> String {
        signUpFormErrors += checkName(Name: userProfileModel.name)
        
        return signUpFormErrors
    }
    
    private func checkName(Name name: String?) -> String {
        if name == nil {
            return "Name can't be empty"
        } else if name!.count <= 3 {
            return "Name must contain more than three characters"
        } else if name!.count > 18 {
            return "Name shouldn't contain more than 18 characters"
        }
        
//        let nameS = name as! NSString
//            guard let regex = try? NSRegularExpression(pattern: "[(a-zA-Z)(\t)]", options: []) else { print("hola") }
//            let results  = regex.matches(in: nameS, options: [], range: NSMakeRange(0, nameS.lenght))
//            return results.map { result in
//                (0..<result.numberOfRanges).map {
//                    result.range(at: $0).location != NSNotFound
//                        ? nameS.substring(with: result.range(at: $0))
//                        : ""
//                }
//            }
        return ""
        
    }
    
}
