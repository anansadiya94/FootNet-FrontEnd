//
//  ViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 26/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class LandingController: BaseViewController, UITextFieldDelegate {

    //IBOutlets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var forgotPasswordButton: CustomSignInSignUpButton!
    @IBOutlet weak var signInButton: CustomSignInSignUpButton!
    @IBOutlet weak var signUpButton: CustomSignInSignUpButton!
    
    
    @IBOutlet weak var changeLanguageLabel: CustomLabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var catalanButton: UIButton!

    var validateSignInForm = ValidateSignInForm()
    var signInFormErrors: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("Load Landing View")
        //Hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureOutlets()
        configureDismissKeyboard()
    }
    
    @IBAction func signIn(_ sender: Any) {
        if validateSignIn() {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = storyboard.instantiateViewController(withIdentifier: "main") as UIViewController
//            self.present(viewController, animated: true, completion: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "main") as UIViewController
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            //alert with the errors
            signInErrorAlert()
        }
    }
    
    private func validateSignIn() -> Bool {
        signInFormErrors = validateSignInForm.CheckSignInForm(Email: (emailTextField.text ?? ""), Password: (passwordTextField.text ?? ""))
        if signInFormErrors.isEmpty {
            //API CALL + api error alert
            print("ok")
            return true
        } else {
            return false
        }
    }
    
    private func signInErrorAlert() {
        let alertTitle = "error"
        let alertMessage = signInFormErrors
        let alertFixTitle = "fix_alert".localize()
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alertFixTitle, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //enable or disable language buttons
    private func enablaDisableButtons() {
        let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
        switch currentLanguage {
        case "en":
            englishButton.isEnabled = false
            break
        case "es":
            spanishButton.isEnabled = false
            break
        case "ca":
            catalanButton.isEnabled = false
            break
        default:
            break
        }
    }
    
    @IBAction func changeToEnglish(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        let landing = self.storyboard?.instantiateViewController(withIdentifier: "landing") as! LandingController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = landing
    }
    
    @IBAction func changeToSpanish(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "es")
        let landing = self.storyboard?.instantiateViewController(withIdentifier: "landing") as! LandingController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = landing
    }
    
    
    @IBAction func changeToCatalan(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ca")
        let landing = self.storyboard?.instantiateViewController(withIdentifier: "landing") as! LandingController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = landing
    }
    
    
    // MARK: UI Configurations
    private func configureOutlets() {
        //placeholders
        emailTextField.placeholder = "email_placeholder".localize()
        emailTextField.keyboardType = .emailAddress
        passwordTextField.placeholder = "password_placeholder".localize()
        passwordTextField.isSecureTextEntry = true
        //buttons
        let forgotPasswordTitle = "forgotPassword_button".localize()
        forgotPasswordButton.setTitle(forgotPasswordTitle, for: .normal)
        let signInTitle = "signIn_button".localize()
        signInButton.setTitle(signInTitle, for: .normal)
        let signUpTitle = "signUp_button".localize()
        signUpButton.setTitle(signUpTitle, for: .normal)
        
        //Change language
        changeLanguageLabel.text = "changeLanguage_label".localize()
        englishButton.setTitle("English", for: .normal)
        spanishButton.setTitle("Español", for: .normal)
        catalanButton.setTitle("Català", for: .normal)
        enablaDisableButtons()
    }
    
    //dismiss keyboad configuration
    private func configureDismissKeyboard() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.setupHideKeyboardOnTap()
    }
    
    //dismiss keyboard by tapping on the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

//dismiss keyboard by tapping anywhere in the view controller
extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}


