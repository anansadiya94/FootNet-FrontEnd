//
//  NotificationsData.swift
//  FootNet
//
//  Created by Anan Sadiya on 01/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

class NotificationsData {
    static func getNotificationsData() -> [DisplayNotificationCell] {
        var notificationsData = [DisplayNotificationCell]()
        let notificationsPostDetail = "notificationsPost_detail".localize()
        let notificationsPhotoDetail = "notificationsPhoto_detail".localize()
        let notificationsVideoDetail = "notificationsVideo_detail".localize()
        notificationsData = [
            DisplayNotificationCell(userImage: #imageLiteral(resourceName: "anan"), notificationDetail: "Anan Sadiya \(notificationsPostDetail)."),
            DisplayNotificationCell(userImage: #imageLiteral(resourceName: "anan"), notificationDetail: "Anan Sadiya \(notificationsPhotoDetail)."),
            DisplayNotificationCell(userImage: #imageLiteral(resourceName: "anan"), notificationDetail: "Anan Sadiya \(notificationsVideoDetail).")
        ]
        return notificationsData
    }
}
