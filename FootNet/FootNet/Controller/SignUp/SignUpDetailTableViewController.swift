//
//  SignUpDetailTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 04/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

class SignUpDetailTableViewController: UITableViewController {

    var signUpDeatilSectionsData = [[SignUpDetailModel]]()
    var profileType : ProfileType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        DDLogInfo("Load SignUp Detail View")
        signUpDeatilSectionsData = SignUpDetailData.getAllsignUpSectionsData(profileType!)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return signUpDeatilSectionsData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signUpDeatilSectionsData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "signUpDetailCell", for: indexPath) as! SignUpDetailCell
        
        // Configure the cell...
        cell.textfield.placeholder = signUpDeatilSectionsData[indexPath.section][indexPath.row].placeholder
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionHeader = ""
        
        switch section {
        case 0:
            sectionHeader = "1"
        case 1:
            sectionHeader = "2"
        case 2:
            sectionHeader = "3"
        case 3:
            sectionHeader = "4"
        default:
            sectionHeader = ""
        }
        
        return sectionHeader
    }
}
