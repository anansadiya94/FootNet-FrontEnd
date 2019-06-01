//
//  PublishTextTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class PublishTextTableViewController: UITableViewController {
    @IBOutlet weak var textPublicationTextView: CustomTextView!
    
    let lottieAnimation = LottieAnimation()
    var textPublication: String = ""
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        createRightButton()
        
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
        
        configureUI()
    }
    
    private func createRightButton() {
        let imageName = "checkButton"
        let image = UIImage(named: imageName)
        let newRightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(PublishTextTableViewController.rightTapped(sender:)))
        newRightBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.rightBarButtonItem = newRightBarButtonItem
    }
    
    private func configureUI() {
        textPublicationTextView.delegate = self
        textPublicationTextView.text = "publishText_title".localize()
        textPublicationTextView.textColor = UIColor.colorPlaceHolderDefault
    }
    
    @objc private func rightTapped(sender: UIBarButtonItem) {
        let date = Date()
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            StaticDBManager.shared.addTextHomeCellResponse(userId: self.userId, publicationText: self.textPublicationTextView.text, publicationDate: date.toString())
            _ = self.navigationController?.popViewController(animated: true)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

extension PublishTextTableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textPublication = textView.text
    }
}
