//
//  NotificationsTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 01/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var notificationDetailLabel: CustomContentLabel!
    @IBOutlet weak var rightArrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
