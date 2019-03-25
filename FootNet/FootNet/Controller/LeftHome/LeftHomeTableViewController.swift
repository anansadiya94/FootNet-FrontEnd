//
//  LeftHomeTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 21/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol AppNavigationDrawerDelegate: class {
    func closeLeftView()
}

class LeftHomeTableViewController: UITableViewController {
    weak var delegate: AppNavigationDrawerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorDarkGreen
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return imageLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 1:
            return nameSurnameLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 2:
            return profileTypeLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 3:
            return myProfileLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 4:
            return editProfileLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 5:
            return signOutLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 6:
            return deactivateLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        default:
            break
        }
        return UITableViewCell()
    }
    
    func imageLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "imageLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.img.image = #imageLiteral(resourceName: "joanet")
            return cell
        }
        return UITableViewCell()
    }
    
    func nameSurnameLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "nameSurnameLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.nameSurnameLabel.text = "Joan Menéndez Alaminos"
            return cell
        }
        return UITableViewCell()
    }
    
    func profileTypeLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "profileTypeLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.profileTypeLabel.text = "Jugador"
            return cell
        }
        return UITableViewCell()
    }
    
    func myProfileLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.myProfileLabel.text = "myProfileLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    func editProfileLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "editProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.editProfileLabel.text = "editProfileLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    func signOutLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "signOutLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.signOutLabel.text = "signOutLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    func deactivateLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "deactivateLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.deactivateAccountLabel.text = "deactivateAccoutLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    //cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        default:
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("myProfileTapped"), object: self)
        case 4:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("editProfileTapped"), object: self)
        case 5:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("signOutTapped"), object: self)
        case 6:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("deactivateAccountTapped"), object: self)
        default:
            break
        }
    }
}
