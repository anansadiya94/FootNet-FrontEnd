//
//  LeftHomeUITests.swift
//  FootNetUITests
//
//  Created by Anan Sadiya on 10/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest

class LeftHomeUITests: XCTestCase {
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
    
    func testOpenLeftHomeCase() {
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
        app.navigationBars["FootNet"].buttons["menuButton"].tap()
    }
    
    func testCloseLeftHome() {
        testOpenLeftHomeCase()
        app.navigationBars["FootNet"].buttons["More Info"].tap()
    }
    
    func testMyProfileLeftHome() {
        testOpenLeftHomeCase()
        app.tables.staticTexts["My profile"].tap()
        app.navigationBars["My profile"].buttons["Back"].tap()
    }
    
    func testEditProfileLeftHome() {
        testOpenLeftHomeCase()
        app.tables.staticTexts["Edit profile"].tap()
        app.navigationBars["Edit profile"].buttons["Back"].tap()
    }
    
    func testSignOutLeftHome() {
        testOpenLeftHomeCase()
        app.tables.staticTexts["Sign out"].tap()
        app.alerts["Are you sure you want to sign out?"].buttons["No"].tap()
        app.tables.staticTexts["Sign out"].tap()
        app.alerts["Are you sure you want to sign out?"].buttons["Yes"].tap()
    }
    
    func testDeactivateAccountLeftHome() {
        testOpenLeftHomeCase()
        app.tables.staticTexts["Deactivate account"].tap()
        app.alerts["Are you sure you want to deactivate your account?"].buttons["No"].tap()
        app.tables.staticTexts["Deactivate account"].tap()
        app.alerts["Are you sure you want to deactivate your account?"].buttons["Yes"].tap()
    }
}
