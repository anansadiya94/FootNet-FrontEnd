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
        DDLogInfo("Load Login View")
        configureOutlets()
    }
    
    // MARK: UI Configuration
    
    private func configureOutlets() {
        
        //placeholders
        textFieldEmail.placeholder = NSLocalizedString("username_placeholder", comment: "")
        let a = NSLocalizedString("username_placeholder", comment: "")
        print(a)
        
        //buttons
    }
    
}

