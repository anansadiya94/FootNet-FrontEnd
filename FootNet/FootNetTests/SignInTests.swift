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
        XCTAssertEqual(signInVC.signInFormErrors, expectedErrors)
    }
    
    // Sign In Form Case 2
    // Invalid Email + Empty Password
    func testSignInFormCase2() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = "A"
        signInVC.passwordTextField!.text = ""
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "invalidEmail_error".localize() + "emptyPassword_error".localize()
        XCTAssertEqual(signInVC.signInFormErrors, expectedErrors)
    }
    
    // Sign In Form Case 3
    // Empty Email + Invalid Password
    func testSignInFormCase3() {
        testCreateSignInScreen()
        signInVC.emailTextField!.text = ""
        signInVC.passwordTextField!.text = "A"
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "emptyEmail_error".localize() + "invalidPassword_error".localize()
        XCTAssertEqual(signInVC.signInFormErrors, expectedErrors)
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
    
    // Sign In Form Case 5
    // invalid Email + invalid Password
    func testSignInFormCase6() {
        testCreateSignInScreen()
        signInVC.signInButton.sendActions(for: .touchUpInside)
        let expectedErrors = "emptyEmail_error".localize() + "emptyPassword_error".localize()
        XCTAssertEqual(signInVC.signInFormErrors, expectedErrors)
    }
    
    // Forgot password Button
    func testForgotPasswordButtonCase() {
        testCreateSignInScreen()
        let targetViewController = signInSB.instantiateViewController(withIdentifier: "forgotPasswordScene")
        let _: UIStoryboardSegue = UIStoryboardSegue(identifier: "signInForgotPasswordSegue", source: signInVC, destination: targetViewController)
    }
    
    // Sign Up Button
    func testSignUpButtonCase() {
        testCreateSignInScreen()
        let targetViewController = signInSB.instantiateViewController(withIdentifier: "signUpScene")
        let _: UIStoryboardSegue = UIStoryboardSegue(identifier: "signInSignUpSegue", source: signInVC, destination: targetViewController)
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
}
