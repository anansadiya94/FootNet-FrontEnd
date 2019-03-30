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
        signUpDetailVC.profileType = ProfileType.Player
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailCoachScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = ProfileType.Coach
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailSportDirectorScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = ProfileType.SportDirector
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailTeamScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = ProfileType.Team
        _ = signUpDetailVC.view
    }
    
    func testCreateSignUpDetailFanScreen() {
        testCreateSignUpSelectScreen()
        signUpDetailVC = signUpSB.instantiateViewController(withIdentifier: "SignUpDetailTableViewController") as! SignUpDetailTableViewController
        signUpDetailVC.profileType = ProfileType.Fan
        _ = signUpDetailVC.view
    }

//     Sign Up Form Case 1
//     Empty Email + Empty Password
//    func testSignUpFormCase1() {
//        testCreateSignUpDetailPlayerScreen()
//        expectedErrors = ""
//        let emilcell = signUpDetailVC.textFieldCell(TableView: signUpDetailVC.tableView, IndexPath: NSIndexPath(row: 0, section: 0) as IndexPath, Placeholder: "signUp_name".localize(), Tag: userProfileTags.email)
//        emilcell.textLabel?.text = ""
//        expectedErrors += "emptyEmail_error".localize()
//        app/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"Siguiente\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        //signUpDetailVC.navigationItem.rightBarButtonItem?.sendActions(for: .touchUpInside)
//        XCTAssertEqual(signUpDetailVC.signUpFormErrors, expectedErrors)
//    }
}
