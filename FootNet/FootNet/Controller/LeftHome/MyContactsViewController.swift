//
//  MyContactsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var displayContactCells = [DisplayContactCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        displayContactCells = StaticDBManager.shared.requestContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayContactCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myContactCell") as! MyContactTableViewCell
        let img = displayContactCells[indexPath.row].photo
        let fullName = displayContactCells[indexPath.row].fullName
        let email = "email_label".localize() + displayContactCells[indexPath.row].email
        let phone = "phone_label".localize() + displayContactCells[indexPath.row].phone
        cell.setUp(img: img, fullName: fullName, email: email, phone: phone)
        return cell
    }
}
