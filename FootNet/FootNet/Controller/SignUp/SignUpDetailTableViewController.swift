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
    var profileType: ProfileType?
    private var datePicker: UIDatePicker?
    var userProfileModel = UserProfileModel()
    let userProfileTags = UserProfileTags()

    
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
        let cellType = signUpDeatilSectionsData[indexPath.section][indexPath.row].tag
        let placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        switch cellType {
        //Section1
        case userProfileTags.name:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.name, Text: userProfileModel.name)
        case userProfileTags.surname:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.surname, Text: userProfileModel.surname ?? "")
        case userProfileTags.phone:
            return phoneTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.phone, Text: userProfileModel.phone)
        case userProfileTags.email:
            return emailTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.email, Text: userProfileModel.email)
        case userProfileTags.password:
            return passwordTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.password, Text: userProfileModel.password)
        case userProfileTags.repeatedPassword:
            return passwordTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.repeatedPassword, Text: userProfileModel.repeatedPassword)
            
        //Section 2
        case userProfileTags.sex:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.sex, Text: userProfileModel.sex ?? "")
        case userProfileTags.birthday:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.birthday, Text: userProfileModel.birthday ?? "")
        case userProfileTags.nationality:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.nationality, Text: userProfileModel.nationality ?? "")
        case userProfileTags.location:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.location, Text: userProfileModel.location)
            
        //Sesction 3
        case userProfileTags.favoritePosition:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.favoritePosition, Text: userProfileModel.favoritePosition ?? "")
        case userProfileTags.preferredPositions:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.preferredPositions, Text: userProfileModel.preferredPositions ?? "")
        case userProfileTags.weight:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.weight, Text: "\(String(describing: userProfileModel.weight))")
        case userProfileTags.height:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.height, Text: "\(String(describing: userProfileModel.height))")
            
        //Section 4
        case userProfileTags.actualClub:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.actualClub, Text: userProfileModel.actualClub ?? "")
        case userProfileTags.photo:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.photo, Text: userProfileModel.photo)
        case userProfileTags.bio:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.bio, Text: userProfileModel.bio)
        case userProfileTags.record:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.record, Text: userProfileModel.record)
  
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func normalTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "normalSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.normalTextField.placeholder = placeholder
            cell.normalTextField.tag = tag
            cell.normalTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    func emailTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "emailSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.emailTextField.placeholder = placeholder
            cell.emailTextField.tag = tag
            cell.emailTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    func phoneTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "phoneSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.phoneTextField.placeholder = placeholder
            cell.phoneTextField.tag = tag
            cell.phoneTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    func passwordTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "passwordSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.passwordTextField.placeholder = placeholder
            cell.passwordTextField.tag = tag
            cell.passwordTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        return dateFormatter.string(from: date)
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
    
    
    @IBAction func customTextFieldEditingChanged(_ sender: CustomTextField) {
        guard let text = sender.text else {
            return
        }
        switch sender.tag {
        case userProfileTags.name:
            userProfileModel.name = text
        case userProfileTags.surname:
            userProfileModel.surname = text
        case userProfileTags.sex:
            userProfileModel.sex = text
        case userProfileTags.birthday:
            userProfileModel.birthday = text
        case userProfileTags.nationality:
            userProfileModel.nationality = text
        case userProfileTags.location:
            userProfileModel.location = text
        case userProfileTags.favoritePosition:
            userProfileModel.favoritePosition = text
        case userProfileTags.preferredPositions:
            userProfileModel.preferredPositions = text
        case userProfileTags.weight:
            userProfileModel.weight = Double(text)
        case userProfileTags.height:
            userProfileModel.height = Double(text)
        case userProfileTags.actualClub:
            userProfileModel.actualClub = text
        case userProfileTags.photo:
            userProfileModel.photo = text
        case userProfileTags.bio:
            userProfileModel.bio = text
        case userProfileTags.record:
            userProfileModel.record = text
        default:
            break
        }
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: EmailTextField) {
        guard let text = sender.text else {
            return
        }
        switch sender.tag {
        case userProfileTags.email:
            userProfileModel.email = text
        default:
            break
        }
    }
    
    @IBAction func phoneTextFieldEditingChanged(_ sender: PhoneTextField) {
        guard let text = sender.text else {
            return
        }
        switch sender.tag {
        case userProfileTags.phone:
            userProfileModel.phone = text
        default:
            break
        }
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: PasswordTextField) {
        guard let text = sender.text else {
            return
        }
        switch sender.tag {
        case userProfileTags.password:
            userProfileModel.password = text
        case userProfileTags.repeatedPassword:
            userProfileModel.repeatedPassword = text
        default:
            break
        }
    }
}
