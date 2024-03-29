//
//  PublishPhotoTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class PublishPhotoTableViewController: UITableViewController {
    @IBOutlet weak var photoPublicationPhotoLabel: CustomLabel!
    @IBOutlet weak var photoPublicationImageView: UIImageView!
    @IBOutlet weak var photoPublicationChangePhotoButton: CustomChoosePhotoButton!
    
    let imagePicker = UIImagePickerController()
    let lottieAnimation = LottieAnimation()
    var chosenImage: UIImage?
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        setTabBarItem()
        createRightButton()
        configureUI()
        
        //Image View Picker
        imagePicker.delegate = self
        
        //Default image
        chosenImage = #imageLiteral(resourceName: "offerPhoto")
        
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        self.title = "publishPhoto_navTitle".localize()
    }
    
    private func createRightButton() {
        let imageName = "checkButton"
        let image = UIImage(named: imageName)
        let newRightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(PublishPhotoTableViewController.rightTapped(sender:)))
        newRightBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.rightBarButtonItem = newRightBarButtonItem
    }
    
    private func configureUI() {
        photoPublicationPhotoLabel.text = "publishPhoto_photoLabel".localize()
        photoPublicationImageView.image = #imageLiteral(resourceName: "offerPhoto")
        photoPublicationChangePhotoButton.setTitle("changePhoto_buttonText".localize(), for: .normal)
    }
    
    @objc private func rightTapped(sender: UIBarButtonItem) {
        let date = Date()
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            StaticDBManager.shared.addPhotoHomeCellResponse(userId: self.userId, publicationPhoto: "joanet", publicationDate: date.toString())
            _ = self.navigationController?.popViewController(animated: true)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func changePhotoTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
}

extension PublishPhotoTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Delegate methods image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        dismiss(animated: true, completion: nil)
        photoPublicationImageView.image = chosenImage
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
