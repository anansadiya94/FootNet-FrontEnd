//
//  NotificationsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var notificationsData = [NotificationsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        getNotificationsData()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "notificationsTabBar".localize()
    }
    
    private func getNotificationsData() {
        notificationsData = NotificationsData.getNotificationsData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationsCell", for: indexPath) as! NotificationsTableViewCell
        cell.userImage.image = notificationsData[indexPath.row].userImage
        cell.notificationDetail.text = notificationsData[indexPath.row].notificationDetail
        cell.notificationDetail.textColor = UIColor.white
        return cell
    }
}
