//
//  SearchTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 22/04/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var searchedProfileImageView: CustomImageView!
    @IBOutlet weak var searchedProfileLabel: CustomContentLabel!
    @IBOutlet weak var seachedProfileStatusButton: CustomFollowButton!
    
    var following: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(img: String, fullName: String, amIFollowing: Bool) {
        searchedProfileImageView.image = UIImage(named: img)
        searchedProfileLabel.text = fullName
        CustomFollowButton.setup(seachedProfileStatusButton, amIFollowing)
        following = amIFollowing
    }
}
