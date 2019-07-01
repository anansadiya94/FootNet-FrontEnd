//
//  SignUpTests.swift
//  FootNetTests
//
//  Created by Anan Sadiya on 28/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import XCTest
@testable import FootNet

class SignUpTests: XCTestCase {
    private var app: XCUIApplication!
    var signUpSB: UIStoryboard = UIStoryboard()
    var signUpSelectVC: SignUpSelectProfileTableViewController = SignUpSelectProfileTableViewController()
    var signUpDetailVC: SignUpDetailTableViewController = SignUpDetailTableViewController()
    let userProfileTags = UserProfileTags()
    var expectedErrors: String = ""
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateSignUpSelectScreen() {
        signUpSB = UIStoryboard(name: "SignUp", bundle: nil)
        signUpSelectVC = signUpSB.instantiateViewController(withIdentifier: "SignUpSelectProfileTableViewController") as! SignUpSelectProfileTableViewController
        _ = signUpSelectVC.view
    }
    
    func testCreateSignUpDetailPlayerScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = .Player
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailCoachScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = .Coach
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailSportDirectorScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = .SportDirector
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailTeamScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = .Team
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailFanScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = .Fan
        _ = signUpDetailVC.view
    }
}
