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
        setNavigationBar()

        DDLogInfo("Load SignUp View")
        signUpSelectProfileData = SignUpSelectProfileData.getAllSignUpSelectProfileData()
    }
    
    private func setNavigationBar() {
        //Navigation bar buttons
        createLeftButton()
        
        // navigationController Configuration
        navigationController?.navigationBar.topItem?.title = "signUp_navBarTitle".localize()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    //Back button navigationbar
    private func createLeftButton() {
        self.navigationItem.hidesBackButton = true
        let imageName = "backButton"
        let image = UIImage(named: imageName)
        let newLeftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SignUpSelectProfileTableViewController.back(sender:)))
        newLeftBarButtonItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = newLeftBarButtonItem
    }
    
    @objc func back(sender: UIBarButtonItem) {
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
        let section = "signUp_sectionHeader".localize()
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
