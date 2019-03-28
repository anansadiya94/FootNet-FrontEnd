//
//  SignUpUITests.swift
//  FootNetUITests
//
//  Created by Anan Sadiya on 28/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest
@testable import FootNet

class SignUpUITests: XCTestCase {
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
    
    func testBackButton() {
        app.buttons["Don't you have an account? Sign Up"].tap()
        app.navigationBars["SignUp"].buttons["backButton"].tap()
    }
    
    func testSelectProfileType() {
        app.buttons["Don't you have an account? Sign Up"].tap()
        let tablesQuery = app.tables
        let backbuttonButton = app.navigationBars["SignUp"].buttons["backButton"]
        let areYouSureYouWantToGoBackAlert = app.alerts["Are you sure you want to go back?"]
        let noButton = areYouSureYouWantToGoBackAlert.buttons["No"]
        let yesButton = areYouSureYouWantToGoBackAlert.buttons["Yes"]
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Player"]/*[[".cells.matching(identifier: \"signUpSelectProfileCell\").staticTexts[\"Player\"]",".staticTexts[\"Player\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backbuttonButton.tap()
        noButton.tap()
        backbuttonButton.tap()
        yesButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Coach"]/*[[".cells.matching(identifier: \"signUpSelectProfileCell\").staticTexts[\"Coach\"]",".staticTexts[\"Coach\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backbuttonButton.tap()
        noButton.tap()
        backbuttonButton.tap()
        yesButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sport Director"]/*[[".cells.matching(identifier: \"signUpSelectProfileCell\").staticTexts[\"Sport Director\"]",".staticTexts[\"Sport Director\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backbuttonButton.tap()
        noButton.tap()
        backbuttonButton.tap()
        yesButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Team"]/*[[".cells.matching(identifier: \"signUpSelectProfileCell\").staticTexts[\"Team\"]",".staticTexts[\"Team\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backbuttonButton.tap()
        noButton.tap()
        backbuttonButton.tap()
        yesButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Fan"]/*[[".cells.matching(identifier: \"signUpSelectProfileCell\").staticTexts[\"Fan\"]",".staticTexts[\"Fan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        backbuttonButton.tap()
        noButton.tap()
        backbuttonButton.tap()
        yesButton.tap()
    }
}
