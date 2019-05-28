//
//  MyContactsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyContactsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var displayContactCells = [DisplayContactCell]()
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        displayContactCells = generateDisplayContactsData()
        setTabBarItem()
    }
    
    private func setTabBarItem() {
        title = "myContactsLabel".localize()
    }
    
    private func generateDisplayContactsData() -> [DisplayContactCell] {
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        for contact in StaticDBManager.shared.requestContacts() {
            if contact.followerId == userId {
                if let user = StaticDBManager.shared.requestUsers().filter({$0.id == contact.followingId}).first {
                    displayContactCells.append(
                        DisplayContactCell(id: user.id, fullName: user.name + " " + user.surname, photo: user.photo, email: user.email, phone: user.phone)
                    )
                }
            }
        }
        return displayContactCells
    }
}

extension MyContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayContactCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myContactCell") as! MyContactTableViewCell
        let id = displayContactCells[indexPath.row].id
        let img = displayContactCells[indexPath.row].photo
        let fullName = displayContactCells[indexPath.row].fullName
        let email = "email_label".localize() + displayContactCells[indexPath.row].email
        let phone = "phone_label".localize() + displayContactCells[indexPath.row].phone
        cell.setUp(id: id, img: img, fullName: fullName, email: email, phone: phone)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let cell = tableView.cellForRow(at: indexPath) as! MyContactTableViewCell
            let contact = displayContactCells.filter({$0.id == cell.contactdId}).first
            StaticDBManager.shared.modifyContacts(userId: userId, contactId: contact!.id)
            displayContactCells.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
