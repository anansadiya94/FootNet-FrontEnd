//
//  NotificationsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var displayNotificationCell = [DisplayNotificationCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        displayNotificationCell = generateDisplayNotificationCell()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "notificationsTabBar".localize()
    }
    
    func generateDisplayNotificationCell() -> [DisplayNotificationCell] {
        for notificationCellResponse in StaticDBManager.shared.requestNotifications() {
            if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == notificationCellResponse.userId}).first {
                var notificationDetail: String = ""
                switch notificationCellResponse.notificationCellType {
                case .Offer:
                    notificationDetail = user.fullName + "notificationsOffer_detail".localize()
                case .Text:
                    notificationDetail = user.fullName + "notificationsPost_detail".localize()
                case .Photo:
                    notificationDetail = user.fullName + "notificationsPhoto_detail".localize()
                }
                displayNotificationCell.append(
                    DisplayNotificationCell(userImage: UIImage(named: user.photo)!, notificationDetail: notificationDetail)
                )
            }
        }
        return displayNotificationCell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayNotificationCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationsCell", for: indexPath) as! NotificationsTableViewCell
        cell.userImageView.image = displayNotificationCell[indexPath.row].userImage
        cell.notificationDetailLabel.text = displayNotificationCell[indexPath.row].notificationDetail
        return cell
    }
}
