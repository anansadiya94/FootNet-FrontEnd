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
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_mobile", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPawword", comment: ""), type: .TextField))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_sex", comment: ""), type: .TextField))
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bithdayDate", comment: ""), type: .TextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_nationality", comment: ""), type: .TextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .TextField))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_actualClub", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .TextField))
            
            //Section 4
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_favoritePosition", comment: ""), type: .TextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_preferredPositions", comment: ""), type: .TextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_weight", comment: ""), type: .TextField))
            section4Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_height", comment: ""), type: .TextField))
        case .Coach, .SportDirector, .Fan:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_mobile", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPawword", comment: ""), type: .TextField))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_sex", comment: ""), type: .TextField))
            section2Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bithdayDate", comment: ""), type: .TextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_nationality", comment: ""), type: .TextField))
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .TextField))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_actualClub", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .TextField))
            
            //Section 4
        case .Team:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_name", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_surname", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_mobile", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_email", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_password", comment: ""), type: .TextField))
            section1Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_repeatPawword", comment: ""), type: .TextField))
            
            //Section 2
            section2Data.append( SignUpDetailModel(placeholder: NSLocalizedString("signUp_location", comment: ""), type: .TextField))
            
            //Section 3
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_photo", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_bio", comment: ""), type: .TextField))
            section3Data.append(SignUpDetailModel(placeholder: NSLocalizedString("signUp_record", comment: ""), type: .TextField))
            
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
