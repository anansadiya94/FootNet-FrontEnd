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
    var signUpSB: UIStoryboard = UIStoryboard()
    var signUpSelectVC: SignUpSelectProfileTableViewController = SignUpSelectProfileTableViewController()
    
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
}
