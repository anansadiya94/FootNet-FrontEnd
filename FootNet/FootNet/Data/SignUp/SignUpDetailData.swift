//
//  SignUpDetailData.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit
import CocoaLumberjack

class SignUpDetailData {
    
    static func getAllsignUpSectionsData(_ profileType: ProfileType) -> [[SignUpDetailModel]] {

        var signUpSectionsData = [[SignUpDetailModel]]()
        
        var section1Data = [SignUpDetailModel]()
        var section2Data = [SignUpDetailModel]()
        var section3Data = [SignUpDetailModel]()
        var section4Data = [SignUpDetailModel]()

        switch profileType {
        case .Player:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_phone", comment: ""), type: .PhoneTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .EmailTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .PasswordTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPassword", comment: ""), type: .PasswordTextField))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_sex", comment: ""), type: .NormalTextField))
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bithdayDate", comment: ""), type: .DateTextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_nationality", comment: ""), type: .NormalTextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .NormalTextField))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_actualClub", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .NormalTextField))
            
            //Section 4
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_favoritePosition", comment: ""), type: .NormalTextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_preferredPositions", comment: ""), type: .NormalTextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_weight", comment: ""), type: .NormalTextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_height", comment: ""), type: .NormalTextField))
        case .Coach, .SportDirector, .Fan:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_phone", comment: ""), type: .PhoneTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .PasswordTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPassword", comment: ""), type: .PasswordTextField))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_sex", comment: ""), type: .NormalTextField))
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bithdayDate", comment: ""), type: .DateTextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_nationality", comment: ""), type: .NormalTextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .NormalTextField))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_actualClub", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .NormalTextField))
            
            //Section 4
        case .Team:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_phone", comment: ""), type: .PhoneTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .NormalTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .PasswordTextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPassword", comment: ""), type: .PasswordTextField))
            
            //Section 2
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .NormalTextField))
            
            //Section 3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .NormalTextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .NormalTextField))
            
            //Section 4
        }
        
        //Adding sections
        if section1Data.isEmpty {
            DDLogInfo("Section 1 is empty")
        } else {
            signUpSectionsData.append(section1Data)
            DDLogInfo("Section 1 was added")
        }
        if section2Data.isEmpty {
            DDLogInfo("Section 2 is empty")
        } else {
            signUpSectionsData.append(section2Data)
            DDLogInfo("Section 2 was added")
        }
        if section3Data.isEmpty {
            DDLogInfo("Section 3 is empty")
        } else {
            signUpSectionsData.append(section3Data)
            DDLogInfo("Section 3 was added")
        }
        if section4Data.isEmpty {
            DDLogInfo("Section 4 is empty")
        } else {
            signUpSectionsData.append(section4Data)
            DDLogInfo("Section 4 was added")
        }
        return signUpSectionsData
    }
}
