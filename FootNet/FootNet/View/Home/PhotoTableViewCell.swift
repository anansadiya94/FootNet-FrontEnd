//
//  PhotoTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 03/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol PhotoHomeCellDelegate : class {
    func increaseCounter(publicationId: Int, selectedButtonTag: Int, toBeSelectedButtonTag: Int, photoTableViewCell: PhotoTableViewCell)
}

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var publicationPhotoImageView: UIImageView!
    @IBOutlet weak var firstReactionCountLabel: UILabel!
    @IBOutlet weak var secondReactionCountLabel: UILabel!
    @IBOutlet weak var thirdReactionCountLabel: UILabel!
    @IBOutlet weak var fourthReactionCountLabel: UILabel!
    @IBOutlet var reactionButtonCollection: [MySuperCustomButton]!
    weak var photoHomeCellDelegate : PhotoHomeCellDelegate?
    var publicationIdD: Int = 0
    
    var selectedButtonTag: Int = 0
    var toBeSelectedButtonTag: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        fullNameLabel.textColor = UIColor.colorText
        firstReactionCountLabel.textColor = UIColor.colorText
        secondReactionCountLabel.textColor = UIColor.colorText
        thirdReactionCountLabel.textColor = UIColor.colorText
        fourthReactionCountLabel.textColor = UIColor.colorText
    }

    func setUp(publicationId: Int, img: String, fullName: String, publicationPhoto: String, publicationReaction: PublicationReaction, photoHomeCellDelegate : PhotoHomeCellDelegate) {
        publicationIdD = publicationId
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        publicationPhotoImageView.image = UIImage(named: publicationPhoto)
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
        self.photoHomeCellDelegate = photoHomeCellDelegate
    }
    
    @IBAction func buttonPressed(_ sender: MySuperCustomButton) {
        if let selectedButton = reactionButtonCollection.filter({$0.isSelected == true}).first {
            selectedButtonTag = selectedButton.tag
        }
        
        reactionButtonCollection.forEach { (button) in
            button.isSelected = button == sender
        }
        sender.isSelected = true
        toBeSelectedButtonTag = sender.tag
        photoHomeCellDelegate?.increaseCounter(publicationId: publicationIdD, selectedButtonTag: selectedButtonTag, toBeSelectedButtonTag: toBeSelectedButtonTag, photoTableViewCell: self)
    }
}
