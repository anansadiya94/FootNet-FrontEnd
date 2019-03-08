//
//  SignUpDetailTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignUpDetailTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate,UIPickerViewDataSource {

    var signUpDeatilSectionsData = [[SignUpDetailModel]]()
    var profileType: ProfileType?
    var userProfileModel = UserProfileModel()
    let userProfileTags = UserProfileTags()
    var dateIndexPath : IndexPath?
    var sexPickerViewIndexPath : IndexPath?
    var nationalityPickerViewIndexPath : IndexPath?
    var locationPickerViewIndexPath : IndexPath?
    var actualClubPickerViewIndexPath : IndexPath?
    var favoritePositionPickerViewIndexPath : IndexPath?
    var preferredPositionPickerViewIndexPath : IndexPath?
    
    @IBOutlet var datePicker : UIDatePicker!
    @IBOutlet var sexPickerView : UIPickerView!
    @IBOutlet var nationalityPickerView : UIPickerView!
    @IBOutlet var locationPickerView : UIPickerView!
    @IBOutlet var actualClubPickerView : UIPickerView!
    @IBOutlet var favoritePositionPickerView : UIPickerView!
    @IBOutlet var preferredPositionPickerView : UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        DDLogInfo("Load SignUp Detail View")
        signUpDeatilSectionsData = SignUpDetailData.getAllsignUpSectionsData(profileType!)
        createBackButton()
        
        //Date Picker
        datePicker = UIDatePicker()
        
        //Picker View
        sexPickerView = UIPickerView()
        nationalityPickerView = UIPickerView()
        locationPickerView = UIPickerView()
        actualClubPickerView = UIPickerView()
        favoritePositionPickerView = UIPickerView()
        preferredPositionPickerView = UIPickerView()
    }
    
    private func createBackButton() {
        self.navigationItem.hidesBackButton = true
        let buttonTitle = NSLocalizedString("back_buttom", comment: "")
        let newBackButton = UIBarButtonItem(title: buttonTitle, style: .plain, target: self, action: #selector(SignUpDetailTableViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: UIBarButtonItem) {
        let alertTitle = NSLocalizedString("title_alert", comment: "")
        let alertMessage = NSLocalizedString("message_alert", comment: "")
        let alertYesTitle = NSLocalizedString("yes_alert", comment: "")
        let alertNoTitle =  NSLocalizedString("no_alert", comment: "")
        
        // Create alert
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        //add yes action
        alert.addAction(UIAlertAction(title: alertYesTitle, style: .default, handler: { action in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        
        //add no action
        alert.addAction(UIAlertAction(title: alertNoTitle, style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
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
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.sex, Text: userProfileModel.sex ?? "")
        case userProfileTags.birthday:
            return dateTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.birthday, Text: userProfileModel.birthday ?? "")
        case userProfileTags.nationality:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.nationality, Text: userProfileModel.nationality ?? "")
        case userProfileTags.location:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.location, Text: userProfileModel.location)
            
        //Section 3
        case userProfileTags.actualClub:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.actualClub, Text: userProfileModel.actualClub ?? "")
        case userProfileTags.photo:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.photo, Text: userProfileModel.photo)
        case userProfileTags.bio:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.bio, Text: userProfileModel.bio)
        case userProfileTags.record:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.record, Text: userProfileModel.record)
            
        //Sesction 4
        case userProfileTags.favoritePosition:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.favoritePosition, Text: userProfileModel.favoritePosition ?? "")
        case userProfileTags.preferredPositions:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.preferredPositions, Text: userProfileModel.preferredPositions ?? "")
        case userProfileTags.weight:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.weight, Text: "\(String(describing: userProfileModel.weight))")
        case userProfileTags.height:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.height, Text: "\(String(describing: userProfileModel.height))")
        default:
            break
        }
        return UITableViewCell()
    }
    
    //sections titles
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
            break
        }
        return sectionHeader
    }
    
    //return normal cell
    func normalTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "normalSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.normalTextField.placeholder = placeholder
            cell.normalTextField.tag = tag
            cell.normalTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    //return email cell
    func emailTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "emailSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.emailTextField.placeholder = placeholder
            cell.emailTextField.tag = tag
            cell.emailTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    //return phone cell
    func phoneTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "phoneSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.phoneTextField.placeholder = placeholder
            cell.phoneTextField.tag = tag
            cell.phoneTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    //return password cell
    func passwordTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "passwordSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.passwordTextField.placeholder = placeholder
            cell.passwordTextField.tag = tag
            cell.passwordTextField.text = text
            return cell
        }
        return UITableViewCell()
    }
    
    //return date cell
    func dateTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "dateSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.dateTextField.placeholder = placeholder
            cell.dateTextField.tag = tag
            datePicker.datePickerMode = UIDatePicker.Mode.date
            datePicker.addTarget(self, action: #selector(setDate(_sender:)), for: .valueChanged)
            cell.dateTextField.inputView = datePicker
            datePicker.timeZone = TimeZone.current
            dateIndexPath = indexPath
            return cell
        }
        return UITableViewCell()
    }
    
    //return picker view cell
    func pickerViewTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int, Text text: String) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "pickerViewSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            switch tag {
            case userProfileTags.sex:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = sexPickerView
                sexPickerView.tag = tag
                sexPickerView.delegate = self
                sexPickerView.dataSource = self
                sexPickerViewIndexPath = indexPath
            case userProfileTags.nationality:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = nationalityPickerView
                nationalityPickerView.tag = tag
                nationalityPickerView.delegate = self
                nationalityPickerView.dataSource = self
                nationalityPickerViewIndexPath = indexPath
            case userProfileTags.location:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = locationPickerView
                locationPickerView.tag = tag
                locationPickerView.delegate = self
                locationPickerView.dataSource = self
                locationPickerViewIndexPath = indexPath
            case userProfileTags.actualClub:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = actualClubPickerView
                actualClubPickerView.tag = tag
                actualClubPickerView.delegate = self
                actualClubPickerView.dataSource = self
                actualClubPickerViewIndexPath = indexPath
            case userProfileTags.favoritePosition:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = favoritePositionPickerView
                favoritePositionPickerView.tag = tag
                favoritePositionPickerView.delegate = self
                favoritePositionPickerView.dataSource = self
                favoritePositionPickerViewIndexPath = indexPath
            case userProfileTags.preferredPositions:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = preferredPositionPickerView
                preferredPositionPickerView.tag = tag
                preferredPositionPickerView.delegate = self
                preferredPositionPickerView.dataSource = self
                preferredPositionPickerViewIndexPath = indexPath
            default:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    //convert date to string
    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        return dateFormatter.string(from: date)
    }
    
    //Save user input in userProfileModel
    @IBAction func customTextFieldEditingChanged(_ sender: CustomTextField) {
        guard let text = sender.text else {
            return
        }
        switch sender.tag {
        case userProfileTags.name:
            userProfileModel.name = text
        case userProfileTags.surname:
            userProfileModel.surname = text
        case userProfileTags.weight:
            userProfileModel.weight = Double(text)
        case userProfileTags.height:
            userProfileModel.height = Double(text)
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
    
    //date picker set date
    @objc func setDate(_sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let selectedDate: String = dateFormatter.string(from: _sender.date)
        print("Selected value \(selectedDate)")
        userProfileModel.birthday = selectedDate
        if let indexPath = dateIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
            cell.dateTextField.text = selectedDate
        }
        view.endEditing(true)
    }
    
    //MARK:- PickerView Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == userProfileTags.sex) {
            return Constants.sexLocalized[row]
        } else if (pickerView.tag == userProfileTags.nationality) {
            return Constants.nationalityLocalized[row]
        } else if (pickerView.tag == userProfileTags.location) {
            return Constants.locationLocalized[row]
        } else if (pickerView.tag == userProfileTags.actualClub) {
            return Constants.actualClubLocalized[row]
        } else if (pickerView.tag == userProfileTags.favoritePosition) {
            return Constants.favoritePositionLocalized[row]
        } else if (pickerView.tag == userProfileTags.preferredPositions) {
            return Constants.preferredPositionLocalized[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == userProfileTags.sex) {
            return Constants.sexLocalized.count
        } else if (pickerView.tag == userProfileTags.nationality) {
            return Constants.nationalityLocalized.count
        } else if (pickerView.tag == userProfileTags.location) {
            return Constants.locationLocalized.count
        } else if (pickerView.tag == userProfileTags.actualClub) {
            return Constants.actualClubLocalized.count
        } else if (pickerView.tag == userProfileTags.favoritePosition) {
            return Constants.favoritePositionLocalized.count
        } else if (pickerView.tag == userProfileTags.preferredPositions) {
            return Constants.preferredPositionLocalized.count
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == userProfileTags.sex) {
            if let indexPath = sexPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.sexLocalized[row]
            }
        } else if (pickerView.tag == userProfileTags.nationality) {
            if let indexPath = nationalityPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.nationalityLocalized[row]
            }
        } else if (pickerView.tag == userProfileTags.location) {
            if let indexPath = locationPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.locationLocalized[row]
            }
        } else if (pickerView.tag == userProfileTags.actualClub) {
            if let indexPath = actualClubPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.actualClubLocalized[row]
            }
        } else if (pickerView.tag == userProfileTags.favoritePosition) {
            if let indexPath = favoritePositionPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.favoritePositionLocalized[row]
            }
        } else if (pickerView.tag == userProfileTags.preferredPositions) {
            if let indexPath = preferredPositionPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.preferredPositionLocalized[row]
            }
        }
        view.endEditing(true)
    }
}
