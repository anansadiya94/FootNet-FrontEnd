//
//  SignUpSelectProfileTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 28/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignUpSelectProfileTableViewController: UITableViewController {

    var signUpSelectProfileData = [SignUpSelectProfileModel]()
    private var profileType : ProfileType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        //Navigation bar buttons
        createBackButton()
        
        // navigationController Configuration
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("signUp_navBarTitle", comment: "")

        DDLogInfo("Load SignUp View")
        signUpSelectProfileData = SignUpSelectProfileData.getAllSignUpSelectProfileData()
    }
    
    //Back button navigationbar
    private func createBackButton() {
        self.navigationItem.hidesBackButton = true
        let buttonTitle = "back_button".localize()
        let newBackButton = UIBarButtonItem(title: buttonTitle, style: .plain, target: self, action: #selector(SignUpSelectProfileTableViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: UIBarButtonItem) {
        //_ = self.navigationController?.popViewController(animated: true)
        _ = self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signUpSelectProfileData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "signUpSelectProfileCell", for: indexPath) as! SignUpSelectProfileCell

        // Configure the cell...
        cell.img.image = signUpSelectProfileData[indexPath.row].img
        cell.lbl.text = signUpSelectProfileData[indexPath.row].title
        
        return cell
    }
    
    //cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //section title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = NSLocalizedString("signUp_sectionHeader", comment: "")
        return section
    }
    
    //sending the profile type to the next storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SignUpDetailTableViewController {
            if let path = tableView.indexPathForSelectedRow {
                let clickedProfileType = signUpSelectProfileData[path.row].type
                destination.profileType = clickedProfileType
                DDLogInfo("\(clickedProfileType) was clicked!")
            }
        }
    }
}
