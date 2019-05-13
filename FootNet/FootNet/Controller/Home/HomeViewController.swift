//
//  HomeViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var publishButton: CustomPublishButton!
    @IBOutlet weak var tableView: UITableView!
    
    var displayTexHomeCells = [DisplayTextHomeCell]()
    var usersBasicInfo = [DisplayUserBasicInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setPublishButton()
        registerNib()
        generateUsersInfo()
        generateDisplayTextHomeCells()
    }
    
    private func generateUsersInfo() {
        for user in Constants.users {
            usersBasicInfo.append(DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname, photo: user.photo))
        }
    }
    
    private func generateDisplayTextHomeCells() {
        for texHomeCellResponse in Constants.texHomeCellsResponse {
            if let user = usersBasicInfo.filter({$0.id == texHomeCellResponse.id}).first {
                displayTexHomeCells.append(
                    DisplayTextHomeCell(id: texHomeCellResponse.id, fullName: user.fullName, photo: user.photo, publicationText: texHomeCellResponse.publicationText, publicationReaction: texHomeCellResponse.publicationReaction)
                )
            }
        }
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "homeTabBar".localize()
    }
    
    private func setPublishButton() {
        publishButton.setTitle("publish_button".localize(), for: .normal)
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "OfferCustomCell", bundle: nil), forCellReuseIdentifier: "offerCustomCell")
        tableView.register(UINib(nibName: "TextCustomCell", bundle: nil), forCellReuseIdentifier: "textCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayTexHomeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCustomCell") as! TextTableViewCell
        cell.userImageView.image = UIImage(named: displayTexHomeCells[indexPath.row].photo)
        cell.nameSurnameLabel.text = displayTexHomeCells[indexPath.row].fullName
        cell.textPostLabel.text = displayTexHomeCells[indexPath.row].publicationText
        return cell
    }
}
