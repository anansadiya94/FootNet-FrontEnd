//
//  FootNetUITests.swift
//  FootNetUITests
//
//  Created by Anan Sadiya on 27/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest
@testable import FootNet

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

    func testTextFieldShouldReturnCase() {
        app.textFields["Email"].tap()
        app.buttons["Next:"].tap()
        app.secureTextFields["Password"].tap()
        app.buttons["Done"].tap()
    }
    
    func testForgotPasswordButtonCase() {
        app.buttons["Did you forget your password?"].tap()
        app.navigationBars["Recover password"].buttons["backButton"].tap()

    }
    
    func testSignUpButtonCase() {
        app.buttons["Don't you have an account? Sign Up"].tap()
        app.navigationBars["SignUp"].buttons["backButton"].tap()
    }
    
    func testValidSignIn () {
        app.textFields["Email"].tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["s"].tap()
        app.keys["a"].tap()
        app.keys["d"].tap()
        app.keys["i"].tap()
        app.keys["y"].tap()
        app.keys["a"].tap()
        app.keys["@"].tap()
        app.keys["g"].tap()
        app.keys["m"].tap()
        app.keys["a"].tap()
        app.keys["i"].tap()
        app.keys["l"].tap()
        app.keys["."].tap()
        app.keys["c"].tap()
        app.keys["o"].tap()
        app.keys["m"].tap()
        app.secureTextFields["Password"].tap()
        app.buttons["shift"].tap()
        app.keys["A"].tap()
        app.keys["n"].tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["more"].tap()
        app.keys["1"].tap()
        app.keys["2"].tap()
        app.keys["3"].tap()
        app.keys["4"].tap()
        app.keys["more"].tap()
        app.buttons["Sign In"].tap()
    }
}
