//
//  SignInTests.swift
//  FootNetTests
//
//  Created by Anan Sadiya on 26/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest
@testable import FootNet

class SignInTests: XCTestCase {
    var signInSB: UIStoryboard = UIStoryboard()
    var signInVC: SignInViewController = SignInViewController()
    
    var currentLanguage = ""
    var expectedLanguage = ""
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateSignInScreen() {
        signInSB = UIStoryboard(name: "SignIn", bundle: nil)
        signInVC = signInSB.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        _ = signInVC.view
    }
    
    // Sign in button
    // Sign In Form Case 1
    // Empty Email + Empty Password
    func testSignInFormCase1() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = ""
        signInVC.passwordTextField!.text = ""
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "emptyEmail_error".localize() + "emptyPassword_error".localize()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            XCTAssertEqual(self.signInVC.signInFormErrors, expectedErrors)
        }
    }
    
    // Sign In Form Case 2
    // Invalid Email + Empty Password
    func testSignInFormCase2() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = "A"
        signInVC.passwordTextField!.text = ""
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "invalidEmail_error".localize() + "emptyPassword_error".localize()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            XCTAssertEqual(self.signInVC.signInFormErrors, expectedErrors)
        }
    }
    
    // Sign In Form Case 3
    // Empty Email + Invalid Password
    func testSignInFormCase3() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = ""
        signInVC.passwordTextField!.text = "A"
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "emptyEmail_error".localize() + "invalidPassword_error".localize()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            XCTAssertEqual(self.signInVC.signInFormErrors, expectedErrors)
        }
    }
    
    // Sign In Form Case 4
    // Valid Email + Valid Password
    func testSignInFormCase4() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = "Anan@gmail.com"
        signInVC.passwordTextField!.text = "Anan1234"
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = ""
        XCTAssertEqual(signInVC.signInFormErrors, expectedErrors)
    }
    
    // Change To English Button
    func testChangeToEnglishButtonCase() {
        testCreateSignInScreen()
        expectedLanguage = "en"

        currentLanguage = "en"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.englishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "es"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.englishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "ca"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.englishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)
    }

    // Change to Spanish Button
    func testChangeToSpanishButtonCase() {
        testCreateSignInScreen()
        expectedLanguage = "es"

        currentLanguage = "en"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.spanishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "es"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.spanishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "ca"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.spanishButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)
    }

    // Change to Catalan Button
    func testChangeToCatalanButtonCase() {
        testCreateSignInScreen()
        expectedLanguage = "ca"

        currentLanguage = "en"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.catalanButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "es"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.catalanButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)

        currentLanguage = "ca"
        LocalizationSystem.sharedInstance.setLanguage(languageCode: currentLanguage)
        signInVC.catalanButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(LocalizationSystem.sharedInstance.getLanguage(), expectedLanguage)
    }
}
