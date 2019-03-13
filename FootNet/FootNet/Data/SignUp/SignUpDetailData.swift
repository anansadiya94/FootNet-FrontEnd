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
        let userProfileTags = UserProfileTags()
        
        var section1Data = [SignUpDetailModel]()
        var section2Data = [SignUpDetailModel]()
        var section3Data = [SignUpDetailModel]()
        var section4Data = [SignUpDetailModel]()

        switch profileType {
        case .Player:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: "signUp_name".localize(), tag: userProfileTags.name))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_surname".localize(), tag: userProfileTags.surname))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_phone".localize(), tag: userProfileTags.phone))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_email".localize(), tag: userProfileTags.email))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_password".localize(), tag: userProfileTags.password))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_repeatPassword".localize(), tag: userProfileTags.repeatPassword))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: "signUp_sex".localize(), tag: userProfileTags.sex))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_bithdayDate".localize(), tag: userProfileTags.birthday))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_nationality".localize(), tag: userProfileTags.nationality))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_location".localize(), tag: userProfileTags.location))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: "signUp_actualClub".localize(), tag: userProfileTags.actualClub))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_photo_label".localize(), tag: userProfileTags.photo))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_bio".localize(), tag: userProfileTags.bio))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_record".localize(), tag: userProfileTags.record))
            
            //Section 4
            section4Data.append(SignUpDetailModel(placeholder: "signUp_favoritePosition".localize(), tag: userProfileTags.favoritePosition))
            section4Data.append(SignUpDetailModel(placeholder: "signUp_preferredPositions".localize(), tag: userProfileTags.preferredPositions))
            section4Data.append(SignUpDetailModel(placeholder: "signUp_weight".localize(), tag: userProfileTags.weight))
            section4Data.append(SignUpDetailModel(placeholder: "signUp_height".localize(), tag: userProfileTags.height))
        case .Coach, .SportDirector, .Fan:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: "signUp_name".localize(), tag: userProfileTags.name))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_surname".localize(), tag: userProfileTags.surname))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_phone".localize(), tag: userProfileTags.phone))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_email".localize(), tag: userProfileTags.email))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_password".localize(), tag: userProfileTags.password))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_repeatPassword".localize(), tag: userProfileTags.repeatPassword))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: "signUp_sex".localize(), tag: userProfileTags.sex))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_bithdayDate".localize(), tag: userProfileTags.birthday))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_nationality".localize(), tag: userProfileTags.nationality))
            section2Data.append(SignUpDetailModel(placeholder: "signUp_location".localize(), tag: userProfileTags.location))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: "signUp_actualClub".localize(), tag: userProfileTags.actualClub))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_photo_label".localize(), tag: userProfileTags.photo))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_bio".localize(), tag: userProfileTags.bio))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_record".localize(), tag: userProfileTags.record))
            
            //Section 4
        case .Team:
            //Section 1
            section1Data.append(SignUpDetailModel(placeholder: "signUp_name".localize(), tag: userProfileTags.name))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_phone".localize(), tag: userProfileTags.phone))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_email".localize(), tag: userProfileTags.email))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_password".localize(), tag: userProfileTags.password))
            section1Data.append(SignUpDetailModel(placeholder: "signUp_repeatPassword".localize(), tag: userProfileTags.repeatPassword))
            
            //Section 2
            section2Data.append(SignUpDetailModel(placeholder: "signUp_location".localize(), tag: userProfileTags.location))
            
            //Section3
            section3Data.append(SignUpDetailModel(placeholder: "signUp_photo_label".localize(), tag: userProfileTags.photo))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_bio".localize(), tag: userProfileTags.bio))
            section3Data.append(SignUpDetailModel(placeholder: "signUp_record".localize(), tag: userProfileTags.record))
            
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
