//
//  FootNetUITests.swift
//  FootNetUITests
//
//  Created by Anan Sadiya on 27/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest

class SignInUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = [
            "-inUITest",
            "-AppleLanguages",
            "(en)",
            "-AppleLocale",
            "en_US"
        ]
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTextFieldShouldReturnCase() {
        app.textFields["Email"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"Siguiente\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.secureTextFields["Password"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"Aceptar\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testForgotPasswordButtonCase() {
        app.buttons["Did you forget your password?"].tap()
        app.navigationBars["Recover password"].buttons["backButton"].tap()

    }
    
    func testSignUpButtonCase() {
        app.buttons["Don't you have an account? Sign Up"].tap()
        app.navigationBars["SignUp"].buttons["backButton"].tap()
    }
}
