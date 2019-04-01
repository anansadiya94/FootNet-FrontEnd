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
    static func getNotificationsData() -> [NotificationsModel] {
        var notificationsData = [NotificationsModel]()
        let notificationsPostDetail = "notificationsPost_detail".localize()
        let notificationsPhotoDetail = "notificationsPhoto_detail".localize()
        let notificationsVideoDetail = "notificationsVideo_detail".localize()
        notificationsData = [
            NotificationsModel(userImage: #imageLiteral(resourceName: "homeRightImage"), notificationDetail: "Anan Sadiya \(notificationsPostDetail)."),
            NotificationsModel(userImage: #imageLiteral(resourceName: "homeRightImage"), notificationDetail: "Anan Sadiya \(notificationsPhotoDetail)."),
            NotificationsModel(userImage: #imageLiteral(resourceName: "homeRightImage"), notificationDetail: "Anan Sadiya \(notificationsVideoDetail).")
        ]
        return notificationsData
        
    }
}
