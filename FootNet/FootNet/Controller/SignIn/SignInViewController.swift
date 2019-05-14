//
//  ViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 26/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignInViewController: BaseViewController, UITextFieldDelegate {
    //IBOutlets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var forgotPasswordButton: CustomSignInSignUpButton!
    @IBOutlet weak var signInButton: CustomSignInSignUpButton!
    @IBOutlet weak var signUpButton: CustomSignInSignUpButton!
    
    @IBOutlet weak var changeLanguageLabel: CustomLabel!
    @IBOutlet weak var englishButton: CustomLanguagesButton!
    @IBOutlet weak var spanishButton: CustomLanguagesButton!
    @IBOutlet weak var catalanButton: CustomLanguagesButton!
    
    let appNavigationDrawer = AppNavigationDrawer()
    let lottieAnimation = LottieAnimation()
    var validateSignInForm = ValidateSignInForm()
    private var signInService = DependencyManager.resolve(interface: SignInServiceProtocol.self)
    var signInFormErrors: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("Load SignIn View")
        configureOutlets()
        configureDismissKeyboard()
        lottieAnimation.createLottieAnimation(view: view)
    }
    
    @IBAction func signIn(_ sender: Any) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            if self.validateSignIn() {
                let viewController = self.appNavigationDrawer.createAppNavigationDrawer()
                self.present(viewController, animated: true, completion: nil)
            } else {
                self.signInErrorAlert("signIn_formError_alert".localize(), self.signInFormErrors)
            }
        }
    }
    
    private func validateSignIn() -> Bool {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        //TODO: REFACTOR
        signInFormErrors = validateSignInForm.CheckSignInForm(Email: email, Password: password)
        if signInFormErrors.isEmpty {
            //API CALL + api error alert
            let signInResponse = signInService!.signInAction(email: email, password: password)
            switch signInResponse.code {
            case 1:
                DDLogInfo("Successfully signed in")
                //Should use the logInResponseStruct.id to recuperate user information
                return true
            case 2:
                signInErrorAlert("signIn_dataError_alert".localize(), "")
                return false
            case 3:
                signInErrorAlert("connectionError_alert".localize(), "")
                return false
            default:
                break
            }
        }
        return false
    }
    
    private func signInErrorAlert(_ alertTitle: String, _ alertMessage: String) {
        showErrorMessageWithoutActionHandler(alertTitle: alertTitle, alertMessage: alertMessage, actionTitle: "tryAgian_alert".localize())
    }
    
    //enable or disable language buttons
    private func enablaDisableButtons() {
        let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
        if (currentLanguage == "en") {
            englishButton.isEnabled = false
        } else if (currentLanguage == "es") {
            spanishButton.isEnabled = false
        } else if (currentLanguage == "ca") {
            catalanButton.isEnabled = false
        }
    }
    
    @IBAction func changeToEnglish(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = signIn
    }
    
    @IBAction func changeToSpanish(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "es")
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = signIn
    }
    
    
    @IBAction func changeToCatalan(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ca")
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = signIn
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
        
        //Comment for testing
        emailTextField.text = "anansadiya@gmail.com"
        passwordTextField.text = "Anan1234"
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
