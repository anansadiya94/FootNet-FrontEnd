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
    
    var userFullName: String = ""
    var userPhoto: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorSecondary
        tableView.tableFooterView = UIView(frame: .zero)
        generateUserInfo()
    }
    
    private func generateUserInfo() {
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == userId}).first {
            userFullName = user.fullName
            userPhoto = user.photo
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return imageLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 1:
            return fullNameLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 2:
            return myProfileLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 3:
            return myPublicationsLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 4:
            return myFriendsLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 5:
            return myContactsLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 6:
            return editProfileLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 7:
            return signOutLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        case 8:
            return deactivateLeftHomeCell(TableView: tableView, IndexPath: indexPath)
        default:
            break
        }
        return UITableViewCell()
    }
    
    func imageLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "imageLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.img.image = UIImage(named: userPhoto)
            return cell
        }
        return UITableViewCell()
    }
    
    func fullNameLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "fullNameLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.fullNameLabel.text = userFullName
            return cell
        }
        return UITableViewCell()
    }
    
    func myProfileLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.myProfileLabel.text = "profileLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    func myPublicationsLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.myProfileLabel.text = "publicationsLabel".localize()
            return cell
        }
        return UITableViewCell()
    }

    func myFriendsLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.myProfileLabel.text = "friendsLabel".localize()
            return cell
        }
        return UITableViewCell()
    }
    
    func myContactsLeftHomeCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath) -> UITableViewCell {
        if let cell: LeftHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myProfileLeftHomeCell", for: indexPath) as? LeftHomeTableViewCell {
            cell.myProfileLabel.text = "contactsLabel".localize()
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
        case 2:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("myProfileTapped"), object: self)
        case 3:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("myPublicationsTapped"), object: self)
        case 4:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("myFriendsTapped"), object: self)
        case 5:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("myContactsTapped"), object: self)
        case 6:
            delegate?.closeLeftView()
            NotificationCenter.default.post(name: Notification.Name("editProfileTapped"), object: self)
        case 7:
            signOutTapped()
        case 8:
            deactivateAccoutTapped()
        default:
            break
        }
    }
    
    private func signOutTapped() {
        DispatchQueue.main.async {
            let alertTitle = "signOut_alert".localize()
            let alertYesTitle = "yes_alert".localize()
            let alertNoTitle =  "no_alert".localize()
            let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: alertYesTitle, style: .default, handler: { action in
                self.delegate?.closeLeftView()
                NotificationCenter.default.post(name: Notification.Name("signOutTapped"), object: self)
            }))
            alert.addAction(UIAlertAction(title: alertNoTitle, style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    private func deactivateAccoutTapped() {
        DispatchQueue.main.async {
            let alertTitle = "deactivateAccout_alert".localize()
            let alertYesTitle = "yes_alert".localize()
            let alertNoTitle =  "no_alert".localize()
            let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: alertYesTitle, style: .default, handler: { action in
                self.delegate?.closeLeftView()
                NotificationCenter.default.post(name: Notification.Name("deactivateAccountTapped"), object: self)
            }))
            alert.addAction(UIAlertAction(title: alertNoTitle, style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
