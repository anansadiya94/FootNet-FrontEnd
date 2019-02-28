//
//  ViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 26/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class LandingController: BaseViewController {

    //IBOutlets
    @IBOutlet weak var textFieldEmail: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    @IBOutlet weak var buttonForgotPassword: CustomButton!
    @IBOutlet weak var buttonSignIn: CustomButton!
    @IBOutlet weak var buttonSignUp: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("Load Landing View")
        configureOutlets()
    }
    
    // MARK: UI Configuration
    
    private func configureOutlets() {
        
        //placeholders
        textFieldEmail.placeholder = NSLocalizedString("email_placeholder", comment: "")
        textFieldPassword.placeholder = NSLocalizedString("password_placeholder", comment: "")
        
        //buttons
        let forgotPasswordTitle = NSLocalizedString("forgotPassword_button", comment: "")
        buttonForgotPassword.setTitle(forgotPasswordTitle, for: .normal)
        let signInTitle = NSLocalizedString("signIn_button", comment: "")
        buttonSignIn.setTitle(signInTitle, for: .normal)
        let signUpTitle = NSLocalizedString("signUp_button", comment: "")
        buttonSignUp.setTitle(signUpTitle, for: .normal)
    }
 
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        print("segue")
//    }
}

