//
//  MyFriendTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyFriendTableViewCell: UITableViewCell {
    @IBOutlet weak var friendProfileImageView: CustomImageView!
    @IBOutlet weak var friendProfileLabel: CustomContentLabel!
    @IBOutlet weak var friendProfileStatusButton: CustomFollowButton!
    
    var following: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(img: String, fullName: String, amIFollowing: Bool) {
        friendProfileImageView.image = UIImage(named: img)
        friendProfileLabel.text = fullName
        CustomFollowButton.setup(friendProfileStatusButton, amIFollowing)
        following = amIFollowing
    }
}
