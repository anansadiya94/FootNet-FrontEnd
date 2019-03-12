//
//  SignUpDetailTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignUpDetailTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

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
    var weightPickerViewIndexPath : IndexPath?
    var heightPickerViewIndexPath : IndexPath?
    var imagePickerViewIndexPath : IndexPath?
    
    @IBOutlet var datePicker : UIDatePicker!
    @IBOutlet var sexPickerView : UIPickerView!
    @IBOutlet var nationalityPickerView : UIPickerView!
    @IBOutlet var locationPickerView : UIPickerView!
    @IBOutlet var actualClubPickerView : UIPickerView!
    @IBOutlet var favoritePositionPickerView : UIPickerView!
    @IBOutlet var preferredPositionPickerView : UIPickerView!
    @IBOutlet var weightPickerView : UIPickerView!
    @IBOutlet var heightPickerView : UIPickerView!
    
    let imagePicker = UIImagePickerController()
    var chosenImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        DDLogInfo("Load SignUp Detail View")
        signUpDeatilSectionsData = SignUpDetailData.getAllsignUpSectionsData(profileType!)
        createBackButton()
        createNextButton()
        
        //Date Picker
        datePicker = UIDatePicker()
        
        //Picker View
        sexPickerView = UIPickerView()
        nationalityPickerView = UIPickerView()
        locationPickerView = UIPickerView()
        actualClubPickerView = UIPickerView()
        favoritePositionPickerView = UIPickerView()
        preferredPositionPickerView = UIPickerView()
        weightPickerView = UIPickerView()
        heightPickerView = UIPickerView()
        
        //Image View Picker
        imagePicker.delegate = self
        
        //Default image
        chosenImage = #imageLiteral(resourceName: "defaultProfilePhoto")
    }
    
    private func createBackButton() {
        self.navigationItem.hidesBackButton = true
        let buttonTitle = "back_button".localize()
        let newBackButton = UIBarButtonItem(title: buttonTitle, style: .plain, target: self, action: #selector(SignUpDetailTableViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    private func createNextButton() {
        let buttonTitle = "done_button".localize()
        let rightBarButtonItem = UIBarButtonItem.init(title: buttonTitle, style: .done, target: self, action: #selector(SignUpDetailTableViewController.nextTapped(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    
    @objc private func nextTapped(sender: UIBarButtonItem) {
        
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
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = signUpDeatilSectionsData[indexPath.section][indexPath.row].tag
        let placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        switch cellType {
        //Section1
        case userProfileTags.name:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.name)
        case userProfileTags.surname:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.surname)
        case userProfileTags.phone:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.phone)
        case userProfileTags.email:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.email)
        case userProfileTags.password:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.password)
        case userProfileTags.repeatedPassword:
            return normalTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.repeatedPassword)
            
        //Section 2
        case userProfileTags.sex:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.sex)
        case userProfileTags.birthday:
            return dateTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.birthday)
        case userProfileTags.nationality:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.nationality)
        case userProfileTags.location:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.location)
            
        //Section 3
        case userProfileTags.actualClub:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.actualClub)
        case userProfileTags.photo:
            return imageViewCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.photo)
        case userProfileTags.bio:
            return textViewCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.bio)
        case userProfileTags.record:
            return textViewCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.record)
            
        //Sesction 4
        case userProfileTags.favoritePosition:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.favoritePosition)
        case userProfileTags.preferredPositions:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.preferredPositions)
        case userProfileTags.weight:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.weight)
        case userProfileTags.height:
            return pickerViewTextFieldCell(TableView: tableView, IndexPath: indexPath, Placeholder: placeholder, Tag: userProfileTags.height)
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
    func normalTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "textFieldSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            switch tag {
            case userProfileTags.phone:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.phone
                cell.normalTextField.keyboardType = .phonePad
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            case userProfileTags.email:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.email
                cell.normalTextField.keyboardType = .emailAddress
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            case userProfileTags.password:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.password
                cell.normalTextField.isSecureTextEntry = true
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            case userProfileTags.repeatedPassword:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.repeatedPassword
                cell.normalTextField.isSecureTextEntry = true
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            case userProfileTags.name:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.name
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            case userProfileTags.surname:
                cell.normalTextField.placeholder = placeholder
                cell.normalTextField.tag = tag
                cell.normalTextField.text = userProfileModel.surname
                cell.normalTextField.clearButtonMode = .whileEditing
                cell.normalTextField.delegate = self
            default:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    //return date cell
    func dateTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "dateSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.dateTextField.placeholder = placeholder
            cell.dateTextField.tag = tag
            cell.dateTextField.inputView = datePicker
            datePicker.datePickerMode = UIDatePicker.Mode.date
            datePicker.addTarget(self, action: #selector(setDate(_sender:)), for: .valueChanged)
            datePicker.timeZone = TimeZone.current
            dateIndexPath = indexPath
            return cell
        }
        return UITableViewCell()
    }
    
    //return image cell
    func imageViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "imageViewSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            cell.imgView.image = chosenImage
            cell.imgView.layer.borderWidth = 1
            cell.imgView.layer.masksToBounds = false
            cell.imgView.layer.borderColor = UIColor.black.cgColor
            cell.imgView.layer.cornerRadius = cell.imgView.frame.height/2
            cell.imgView.clipsToBounds = true
            cell.imgView.tag = tag
            cell.profileLabelImageView.text = "signUp_photo_label".localize()
            cell.profileLabelImageView.font = UIFont.textFieldFontOfSize
            cell.changeImageButton.setTitle("signUp_photo_button".localize(), for: .normal)
            imagePickerViewIndexPath = indexPath
            return cell
        }
        return UITableViewCell()
    }
    
    //return text view cell
    func textViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "textViewSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            switch tag {
            case userProfileTags.bio:
                if cell.textView.text.isEmpty {
                    cell.textView.text = "signUp_edit_bio".localize()
                    cell.textView.textColor = UIColor.textFieldPlaceHolderDefault
                } else {
                    cell.textView.text = userProfileModel.bio
                    cell.textView.textColor = .black
                }
                cell.textView.font = UIFont.textFieldFontOfSize
                cell.textView.delegate = self
                cell.textView.tag = tag
            case userProfileTags.record:
                if cell.textView.text.isEmpty {
                    cell.textView.text = "signUp_edit_record".localize()
                    cell.textView.textColor = UIColor.textFieldPlaceHolderDefault
                } else {
                    cell.textView.text = userProfileModel.record
                    cell.textView.textColor = .black
                }
                cell.textView.font = UIFont.textFieldFontOfSize
                cell.textView.delegate = self
                cell.textView.tag = tag
            default:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    //return picker view cell
    func pickerViewTextFieldCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, Placeholder placeholder: String, Tag tag: Int) -> UITableViewCell {
        if let cell: SignUpDetailCell = tableView.dequeueReusableCell(withIdentifier: "pickerViewSignUpDetailCell", for: indexPath) as? SignUpDetailCell {
            switch tag {
            case userProfileTags.sex:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = sexPickerView
                cell.pickerViewTextField.text = userProfileModel.sex
                sexPickerView.tag = tag
                sexPickerView.delegate = self
                sexPickerView.dataSource = self
                sexPickerViewIndexPath = indexPath
            case userProfileTags.nationality:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = nationalityPickerView
                cell.pickerViewTextField.text = userProfileModel.nationality
                nationalityPickerView.tag = tag
                nationalityPickerView.delegate = self
                nationalityPickerView.dataSource = self
                nationalityPickerViewIndexPath = indexPath
            case userProfileTags.location:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = locationPickerView
                cell.pickerViewTextField.text = userProfileModel.location
                locationPickerView.tag = tag
                locationPickerView.delegate = self
                locationPickerView.dataSource = self
                locationPickerViewIndexPath = indexPath
            case userProfileTags.actualClub:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = actualClubPickerView
                cell.pickerViewTextField.text = userProfileModel.actualClub
                actualClubPickerView.tag = tag
                actualClubPickerView.delegate = self
                actualClubPickerView.dataSource = self
                actualClubPickerViewIndexPath = indexPath
            case userProfileTags.favoritePosition:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = favoritePositionPickerView
                cell.pickerViewTextField.text = userProfileModel.favoritePosition
                favoritePositionPickerView.tag = tag
                favoritePositionPickerView.delegate = self
                favoritePositionPickerView.dataSource = self
                favoritePositionPickerViewIndexPath = indexPath
            case userProfileTags.preferredPositions:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = preferredPositionPickerView
                cell.pickerViewTextField.text = userProfileModel.preferredPositions
                preferredPositionPickerView.tag = tag
                preferredPositionPickerView.delegate = self
                preferredPositionPickerView.dataSource = self
                preferredPositionPickerViewIndexPath = indexPath
            case userProfileTags.weight:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = weightPickerView
                cell.pickerViewTextField.text = userProfileModel.weight
                weightPickerView.tag = tag
                weightPickerView.delegate = self
                weightPickerView.dataSource = self
                weightPickerViewIndexPath = indexPath
            case userProfileTags.height:
                cell.pickerViewTextField.placeholder = placeholder
                cell.pickerViewTextField.tag = tag
                cell.pickerViewTextField.inputView = heightPickerView
                cell.pickerViewTextField.text = userProfileModel.height
                heightPickerView.tag = tag
                heightPickerView.delegate = self
                heightPickerView.dataSource = self
                heightPickerViewIndexPath = indexPath
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
    
    //hide keyboard when return button clicked
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        case userProfileTags.phone:
            userProfileModel.phone = text
        case userProfileTags.email:
            userProfileModel.email = text
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
        } else if (pickerView.tag == userProfileTags.weight) {
            return Constants.weightLocalized[row]
        } else if (pickerView.tag == userProfileTags.height) {
            return Constants.heightLocalized[row]
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
        } else if (pickerView.tag == userProfileTags.weight) {
            return Constants.weightLocalized.count
        } else if (pickerView.tag == userProfileTags.height) {
            return Constants.heightLocalized.count
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
                userProfileModel.sex = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.nationality) {
            if let indexPath = nationalityPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.nationalityLocalized[row]
                userProfileModel.nationality = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.location) {
            if let indexPath = locationPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.locationLocalized[row]
                userProfileModel.location = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.actualClub) {
            if let indexPath = actualClubPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.actualClubLocalized[row]
                userProfileModel.actualClub = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.favoritePosition) {
            if let indexPath = favoritePositionPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.favoritePositionLocalized[row]
                userProfileModel.favoritePosition = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.preferredPositions) {
            if let indexPath = preferredPositionPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.preferredPositionLocalized[row]
                userProfileModel.preferredPositions = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.weight) {
            if let indexPath = weightPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.weightLocalized[row]
                userProfileModel.weight = cell.pickerViewTextField.text
            }
        } else if (pickerView.tag == userProfileTags.height) {
            if let indexPath = heightPickerViewIndexPath, let cell = tableView.cellForRow(at: indexPath) as? SignUpDetailCell {
                cell.pickerViewTextField.text = Constants.heightLocalized[row]
                userProfileModel.height = cell.pickerViewTextField.text
            }
        }
        view.endEditing(true)
    }
    
    @IBAction func choosePhotoTapped(_ sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - Delegate methods
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case userProfileTags.record:
            userProfileModel.record = textView.text
        case userProfileTags.bio:
            userProfileModel.bio = textView.text
        default:
            break
        }
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
