//
//  MyTextTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyTextTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var publicationTextLabel: CustomContentLabel!
    @IBOutlet weak var firstReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var secondReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var thirdReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var fourthReactionCountLabel: CustomContentLabel!
    @IBOutlet var reactionButtonCollection: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(publicationId: Int, img: String, fullName: String, publicationText: String, publicationReaction: PublicationReaction) {
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        publicationTextLabel.text = publicationText
        firstReactionCountLabel.text = String(publicationReaction.firstReactionCount.reactionCount)
        secondReactionCountLabel.text = String(publicationReaction.secondReactionCount.reactionCount)
        thirdReactionCountLabel.text = String(publicationReaction.thirdReactionCount.reactionCount)
        fourthReactionCountLabel.text = String(publicationReaction.fourthReactionCount.reactionCount)
        reactionButtonCollection.forEach { (button) in
            switch button.tag {
            case 1:
                button.isSelected = publicationReaction.firstReactionCount.reactionStatus
            case 2:
                button.isSelected = publicationReaction.secondReactionCount.reactionStatus
            case 3:
                button.isSelected = publicationReaction.thirdReactionCount.reactionStatus
            case 4:
                button.isSelected = publicationReaction.fourthReactionCount.reactionStatus
            default:
                break
            }
        }
    }
}
