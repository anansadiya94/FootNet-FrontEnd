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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTabBarItem()
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
                    notificationDetail = user.fullName + "notificationsOffer_detail".localize() +  StaticDBManager.shared.requestOfferTitleById(offerId: notificationCellResponse.publicationId)
                case .Text:
                    notificationDetail = user.fullName + "notificationsPost_detail".localize() +  StaticDBManager.shared.requestTexteById(textId: notificationCellResponse.publicationId)
                case .Photo:
                    notificationDetail = user.fullName + "notificationsPhoto_detail".localize()
                }
                displayNotificationCell.append(
                    DisplayNotificationCell(userId: user.id, notificationType: notificationCellResponse.notificationCellType, publicationId: notificationCellResponse.publicationId, userImage: UIImage(named: user.photo)!, notificationDetail: notificationDetail)
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
        switch self.displayNotificationCell[indexPath.row].notificationType {
        case .Offer:
            cell.rightArrowImageView.isHidden = false
        default:
            cell.rightArrowImageView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.displayNotificationCell[indexPath.row].notificationType {
        case .Offer:
            let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
            let profileViewController = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            profileViewController.userId = self.displayNotificationCell[indexPath.row].userId
            profileViewController.viewProfileType = .RequestedProfile
            title = " "
            navigationController?.pushViewController(profileViewController, animated: true)
        default:
            break
        }
    }
}
