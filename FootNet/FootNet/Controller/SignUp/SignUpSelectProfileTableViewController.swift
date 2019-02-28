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

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        //navigationController?.navigationItem.leftBarButtonItem
        //navigationController?.navigationItem.hidesBackButton = false
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("signUp_navBarTitle", comment: "")

        DDLogInfo("Load SignUp View")
        signUpSelectProfileData = SignUpSelectProfileData.getAllSignUpSelectProfileData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return signUpSelectProfileData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "signUpSelectProfileCell", for: indexPath) as! SignUpSelectProfileCell

        // Configure the cell...
        cell.img.image = signUpSelectProfileData[indexPath.row].img
        cell.lbl.text = signUpSelectProfileData[indexPath.row].title

        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = signUpSelectProfileData[indexPath.row].type
        switch type {
        case .Player:
            DDLogInfo("Player type was clicked")
        case .Coach:
            DDLogInfo("Coach type was clicked")
        case .SportDirector:
            DDLogInfo("Sport director type was clicked")
        case .Team:
            DDLogInfo("Team type was clicked")
        case .Fan:
            DDLogInfo("Fan type was clicked")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
