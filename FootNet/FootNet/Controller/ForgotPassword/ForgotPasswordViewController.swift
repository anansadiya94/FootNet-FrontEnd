//
//  ForgotPasswordViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import MessageUI

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var recoverPasswordLabel: CustomContentLabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var recoverPasswordButton: CustomRecoverPassword!
    
    let lottieAnimation = LottieAnimation()
    var validateSignInForm = ValidateSignInForm()
    var forgotPasswordFormErrors: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setNavigationBar()
        configureOutlets()
        configureDismissKeyboard()
        lottieAnimation.createLottieAnimation(view: view)
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    private func setNavigationBar() {
        //Navigation bar buttons
        createLeftButton()
        
        // navigationController Configuration
        navigationController?.navigationBar.topItem?.title = "forgotPassword_navBarTitle".localize()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.colorText]
        navigationController?.navigationBar.barTintColor = UIColor.colorBars
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.colorText]
        self.navigationItem.searchController = nil
        definesPresentationContext = true
    }
    
    //Back button navigationbar
    private func createLeftButton() {
        self.navigationItem.hidesBackButton = true
        let imageName = "backButton"
        let image = UIImage(named: imageName)
        let newLeftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(ForgotPasswordViewController.back(sender:)))
        newLeftBarButtonItem.tintColor = UIColor.colorText
        self.navigationItem.leftBarButtonItem = newLeftBarButtonItem
    }
    
    @objc func back(sender: UIBarButtonItem) {
        _ = self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func recoverPaawordTapped(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            if self.validateEmail() {
                let composeVC = MFMailComposeViewController()
                composeVC.mailComposeDelegate = self
                composeVC.setToRecipients(["recoverPassword@footnet.com"])
                composeVC.setSubject("[FootNet]" + "recoverPassword_subject".localize())
                composeVC.setMessageBody("recoverPassword_content1".localize() + self.emailTextField.text! + "recoverPassword_content2".localize(), isHTML: false)
                self.present(composeVC, animated: true, completion: nil)
            }
            else {
                self.forgotPasswordErrorAlert(self.forgotPasswordFormErrors, "")
            }
        }
    }
    
    private func validateEmail() -> Bool{
        let email = emailTextField.text!
        forgotPasswordFormErrors = validateSignInForm.checkEmail(email)
        if forgotPasswordFormErrors.isEmpty {
            return true
        }
        return false
    }
    
    private func forgotPasswordErrorAlert(_ alertTitle: String, _ alertMessage: String) {
        showErrorMessageWithoutActionHandler(alertTitle: alertTitle, alertMessage: alertMessage, actionTitle: "tryAgian_alert".localize())
    }
    
    // MARK: UI Configurations
    private func configureOutlets() {
        recoverPasswordLabel.text = "recoverPassword_label".localize()
        
        emailTextField.placeholder = "email_placeholder".localize()
        emailTextField.keyboardType = .emailAddress
        
        let recoverPasswordTitle = "recoverPassword_button".localize()
        recoverPasswordButton.setTitle(recoverPasswordTitle, for: .normal)
    }
    
    //dismiss keyboad configuration
    private func configureDismissKeyboard() {
        emailTextField.delegate = self
        self.setupHideKeyboardOnTap()
    }
    
    //dismiss keyboard by tapping on the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}

extension ForgotPasswordViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
