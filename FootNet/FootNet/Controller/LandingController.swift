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
    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    @IBOutlet weak var buttonForgotPassword: CustomSignInSignUpButton!
    @IBOutlet weak var buttonSignIn: CustomSignInSignUpButton!
    @IBOutlet weak var buttonSignUp: CustomSignInSignUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("Load Landing View")
        configureOutlets()
        configureDismissKeyboard()
    }
    
    // MARK: UI Configurations
    private func configureOutlets() {
        //placeholders
        textFieldEmail.placeholder = NSLocalizedString("email_placeholder", comment: "")
        textFieldEmail.keyboardType = .emailAddress
        textFieldPassword.placeholder = NSLocalizedString("password_placeholder", comment: "")
        textFieldPassword.isSecureTextEntry = true
        //buttons
        let forgotPasswordTitle = NSLocalizedString("forgotPassword_button", comment: "")
        buttonForgotPassword.setTitle(forgotPasswordTitle, for: .normal)
        let signInTitle = NSLocalizedString("signIn_button", comment: "")
        buttonSignIn.setTitle(signInTitle, for: .normal)
        let signUpTitle = NSLocalizedString("signUp_button", comment: "")
        buttonSignUp.setTitle(signUpTitle, for: .normal)
    }
    
    //dismiss keyboad configuration
    private func configureDismissKeyboard() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        self.setupHideKeyboardOnTap()
    }
    
    //dismiss keyboard by tapping on the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
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


