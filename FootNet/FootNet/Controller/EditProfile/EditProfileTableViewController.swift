//
//  EditProfleViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController {
    @IBOutlet weak var editProfilePhotoLabel: CustomLabel!
    @IBOutlet weak var editProfilePhotoImageView: UIImageView!
    @IBOutlet weak var editProfileChangePhotoButton: CustomChoosePhotoButton!
    @IBOutlet weak var editProfileBioTextView: CustomTextView!
    @IBOutlet weak var editProfileRecordTextView: CustomTextView!
    
    let imagePicker = UIImagePickerController()
    let lottieAnimation = LottieAnimation()
    var chosenImage: UIImage?
    var userId: Int = 0
    var userPhoto: String = ""
    var userBio: String = ""
    var userRecord: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        createRightButton()
        generateUserInfo()
        
        //Image View Picker
        imagePicker.delegate = self
        
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
        configureUI()
    }
    
    private func setTabBarItem() {
        title = "editProfileLabel".localize()
    }
    
    private func generateUserInfo() {
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        if let user = StaticDBManager.shared.requestUsers().filter({$0.id == userId}).first {
            userPhoto = user.photo
            userBio = user.bio
            userRecord = user.record
        }
    }
    
    private func createRightButton() {
        let imageName = "checkButton"
        let image = UIImage(named: imageName)
        let newRightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(EditProfileTableViewController.rightTapped(sender:)))
        newRightBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.rightBarButtonItem = newRightBarButtonItem
    }
    
    private func configureUI() {
        editProfileBioTextView.delegate = self
        editProfileBioTextView.text = userBio
        editProfileBioTextView.textColor = UIColor.colorPlaceHolderDefault
        editProfileRecordTextView.delegate = self
        editProfileRecordTextView.text = userRecord
        editProfileRecordTextView.textColor = UIColor.colorPlaceHolderDefault
        editProfilePhotoLabel.text = "editPhoto_photoLabel".localize()
        editProfilePhotoImageView.image = UIImage(named: userPhoto)
        editProfileChangePhotoButton.setTitle("editProfileChanePhoto_buttonText".localize(), for: .normal)
    }
    
    @objc private func rightTapped(sender: UIBarButtonItem) {
        //TODO: pasar la foto a string
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            StaticDBManager.shared.modifyUser(userId: self.userId, userPhoto: "messi", userBio: self.editProfileBioTextView.text, userRecord: self.editProfileRecordTextView.text)
            _ = self.navigationController?.popViewController(animated: true)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func choosePhotoTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
}

extension EditProfileTableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            userBio = textView.text
        case 1:
            userRecord = textView.text
        default:
            break
        }
    }
}

extension EditProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegate methods image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        dismiss(animated: true, completion: nil)
        editProfilePhotoImageView.image = chosenImage
        tableView.reloadData()
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
