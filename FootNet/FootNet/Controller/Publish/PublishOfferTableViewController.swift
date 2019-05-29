//
//  PublishOfferTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class PublishOfferTableViewController: UITableViewController {
    @IBOutlet weak var offerPublicationTitleTextView: CustomTextView!
    @IBOutlet weak var offerPublicationTextTextView: CustomTextView!
    @IBOutlet weak var offerPublicationPhotoLabel: CustomLabel!
    @IBOutlet weak var offerPublicationPhotoImageView: UIImageView!
    @IBOutlet weak var offerPublicationChangePhotoButton: CustomChoosePhotoButton!
    
    let imagePicker = UIImagePickerController()
    var offerTitle: String = ""
    var offerText: String = ""
    var chosenImage: UIImage?
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        createRightButton()
        configureUI()
        
        //Image View Picker
        imagePicker.delegate = self
        
        //Default image
        chosenImage = #imageLiteral(resourceName: "offerPhoto")
    }
    
    private func createRightButton() {
        let imageName = "checkButton"
        let image = UIImage(named: imageName)
        let newRightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(PublishOfferTableViewController.rightTapped(sender:)))
        newRightBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.rightBarButtonItem = newRightBarButtonItem
    }
    
    private func configureUI() {
        offerPublicationTitleTextView.delegate = self
        offerPublicationTitleTextView.text = "publishOffer_title".localize()
        offerPublicationTitleTextView.textColor = UIColor.colorPlaceHolderDefault
        offerPublicationTextTextView.delegate = self
        offerPublicationTextTextView.text = "publishOffer_text".localize()
        offerPublicationTextTextView.textColor = UIColor.colorPlaceHolderDefault
        offerPublicationPhotoLabel.text = "publishOffer_photoLabel".localize()
        offerPublicationPhotoImageView.image = #imageLiteral(resourceName: "offerPhoto")
        offerPublicationChangePhotoButton.setTitle("changePhoto_buttonText".localize(), for: .normal)
    }
    
    @objc private func rightTapped(sender: UIBarButtonItem) {
        let date = Date()
        StaticDBManager.shared.addOfferCellResponse(userId: userId, publicationTitle: offerPublicationTitleTextView.text, publicationText: offerPublicationTextTextView.text, publicationPhoto: "joanet", publicationDate: date.toString())
        _ = self.navigationController?.popViewController(animated: true)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func choosePhotoTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
}

extension PublishOfferTableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            offerTitle = textView.text
        case 1:
            offerText = textView.text
        default:
            break
        }
    }
}

extension PublishOfferTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegate methods image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        dismiss(animated: true, completion: nil)
        offerPublicationPhotoImageView.image = chosenImage
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
