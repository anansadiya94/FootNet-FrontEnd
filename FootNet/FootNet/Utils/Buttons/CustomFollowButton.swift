//
//  CustomFollowButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomFollowButton: UIButton {
    class func setup(_ followButton: CustomFollowButton, _ isFollowed: Bool) {
        var color: UIColor
        if(isFollowed) {
            color = UIColor.colorSecondary
            followButton.setTitle("following_button".localize(), for: .normal)
        } else {
            color = .red
            followButton.setTitle("follow_button".localize(), for: .normal)
        }
        let disabledColor = color.withAlphaComponent(0.3)
        let btnFont = UIFont.fontSystemS20
        followButton.clipsToBounds = true
        followButton.layer.cornerRadius = 5.0
        followButton.layer.borderColor = color.cgColor
        followButton.layer.borderWidth = 1
        followButton.setTitleColor(color, for: .normal)
        followButton.setTitleColor(disabledColor, for: .disabled)
        followButton.titleLabel?.font = btnFont
        followButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
