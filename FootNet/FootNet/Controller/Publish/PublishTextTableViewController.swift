//
//  PublishTextTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class PublishTextTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        createRightButton()
    }
    
    private func createRightButton() {
        let imageName = "checkButton"
        let image = UIImage(named: imageName)
        let newRightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(PublishTextTableViewController.rightTapped(sender:)))
        newRightBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.rightBarButtonItem = newRightBarButtonItem
    }
    
    @objc private func rightTapped(sender: UIBarButtonItem) {
        //TODO: ADD OFFER AND BACK TO HOME
    }
}
