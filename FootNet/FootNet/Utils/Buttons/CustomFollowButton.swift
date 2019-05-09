//
//  CustomFollowButton.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class CustomFollowButton: UIButton {
    class func setup(_ customFollowButton: CustomFollowButton, _ amIFollowing: Bool) {
        var color: UIColor
        if(amIFollowing) {
            color = UIColor.colorSecondary
            customFollowButton.setTitle("following_button".localize(), for: .normal)
        } else {
            color = .red
            customFollowButton.setTitle("follow_button".localize(), for: .normal)
        }
        let disabledColor = color.withAlphaComponent(0.3)
        let btnFont = UIFont.fontSystemS20
        customFollowButton.clipsToBounds = true
        customFollowButton.layer.cornerRadius = 5.0
        customFollowButton.layer.borderColor = color.cgColor
        customFollowButton.layer.borderWidth = 1
        customFollowButton.setTitleColor(color, for: .normal)
        customFollowButton.setTitleColor(disabledColor, for: .disabled)
        customFollowButton.titleLabel?.font = btnFont
        customFollowButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
