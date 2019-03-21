//
//  RightHomeViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class RightHomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorDarkGreen
    }
    
    @IBAction func linkedInButton(_ sender: Any) {
        let webURL = URL(string: "https://www.linkedin.com/in/anan-sadiya-26071994/")!
        let appURL = URL(string: "linkedin://profile/anan-sadiya-26071994/")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        let Username =  "Anansadiya94" // Your Instagram Username here
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(Username)")!
            application.open(webURL)
        }
    }
}
