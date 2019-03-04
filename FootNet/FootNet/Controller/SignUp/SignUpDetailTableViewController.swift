//
//  SignUpDetailTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignUpDetailTableViewController: UITableViewController, UITextFieldDelegate {

    var signUpDeatilSectionsData = [[SignUpDetailModel]]()
    var profileType : ProfileType?
    private var datePicker: UIDatePicker?
    var userProfileModel = UserProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        DDLogInfo("Load SignUp Detail View")
        signUpDeatilSectionsData = SignUpDetailData.getAllsignUpSectionsData(profileType!)
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return signUpDeatilSectionsData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signUpDeatilSectionsData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = signUpDeatilSectionsData[indexPath.section][indexPath.row].type
        var cell: SignUpDetailCell
        switch cellType {
        case .NormalTextField:
            cell = tableView.dequeueReusableCell(withIdentifier: "normalSignUpDetailCell", for: indexPath) as! SignUpDetailCell
            cell.normalTextField.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        case .EmailTextField:
            cell = tableView.dequeueReusableCell(withIdentifier: "emailSignUpDetailCell", for: indexPath) as! SignUpDetailCell
            cell.emailTextField.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
            cell.emailTextField.text = userProfileModel.email
            cell.emailTextField.delegate = self
        case .PhoneTextField:
            cell = tableView.dequeueReusableCell(withIdentifier: "phoneSignUpDetailCell", for: indexPath) as! SignUpDetailCell
            cell.phoneTextField.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        case .PasswordTextField:
            cell = tableView.dequeueReusableCell(withIdentifier: "passwordSignUpDetailCell", for: indexPath) as! SignUpDetailCell
            cell.passwordTextField.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        case .DateTextField:
            cell = tableView.dequeueReusableCell(withIdentifier: "dateSignUpDetailCell", for: indexPath) as! SignUpDetailCell
            cell.dateTextField.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
            cell.dateTextField.inputView = datePicker
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionHeader = ""
        
        switch section {
        case 0:
            sectionHeader = "1"
        case 1:
            sectionHeader = "2"
        case 2:
            sectionHeader = "3"
        case 3:
            sectionHeader = "4"
        default:
            sectionHeader = ""
        }
        
        return sectionHeader
    }
}
