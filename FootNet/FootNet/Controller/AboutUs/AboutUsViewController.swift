//
//  AboutUsViewController
//  FootNet
//
//  Created by Anan Sadiya on 18/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import MessageUI

class AboutUsViewController: UIViewController {
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var doubtEmailMessageLabel: UILabel!
    @IBOutlet weak var donateEmailMessageLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        configureOutlets()
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        title = "aboutUsLabel".localize()
    }
    
    private func configureOutlets() {
        workLabel.text = "workLabel".localize()
        doubtEmailMessageLabel.text = "doubtEmailMessageLabel".localize()
        donateEmailMessageLabel.text = "donateEmailMessageLabel".localize()
        followLabel.text = "followLabel".localize()
    }
    
    @IBAction func sendAnEmailButton(_ sender: Any) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["anansadiya@gmail.com"])
        composeVC.setSubject("[FootNet]")
        composeVC.setMessageBody("Message content.", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    @IBAction func linkedInButton(_ sender: Any) {
        let username =  "anan-sadiya-26071994"
        let webURL = URL(string: "https://www.linkedin.com/in/\(username)/")!
        let appURL = URL(string: "linkedin://profile/\(username)/")!
        
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        let username =  "Anansadiya94"
        let appURL = URL(string: "instagram://user?username=\(username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(username)")!
            application.open(webURL)
        }
    }
}

extension AboutUsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
