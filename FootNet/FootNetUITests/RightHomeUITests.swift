//
//  RightHomeUITests.swift
//  FootNetUITests
//
//  Created by Anan Sadiya on 10/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest

class RightHomeUITests: XCTestCase {
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
    
    func testOpenRightHomeCase() {
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
        app.navigationBars["FootNet"].buttons["More Info"].tap()
    }
    
    func testCloseRightHome() {
        testOpenRightHomeCase()
        app.children(matching: .window).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
    }
    
    //It's not working with the simulator
//    func testSendAnEmailRightHome() {
//        testOpenRightHomeCase()
//        app.buttons["Send an email"].tap()
//    }
    
    func testOpenInstagramRightHome() {
        testOpenRightHomeCase()
        app.buttons["LinkedIn"].tap()
    }
    
    func testOpenLinkedInRightHome() {
        testOpenRightHomeCase()
        app.buttons["Instagram"].tap()
    }
}


