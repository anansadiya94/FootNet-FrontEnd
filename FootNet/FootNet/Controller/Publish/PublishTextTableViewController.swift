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
    
    var textPublication: String = ""
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        createRightButton()
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
        StaticDBManager.shared.addTextHomeCellResponse(userId: userId, publicationText: textPublicationTextView.text, publicationDate: date.toString())
        _ = self.navigationController?.popViewController(animated: true)
        _ = self.navigationController?.popViewController(animated: true)
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
