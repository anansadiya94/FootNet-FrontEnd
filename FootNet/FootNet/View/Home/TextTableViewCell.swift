//
//  TextTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 09/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol TextHomeCellDelegate : class {
    func increaseCounter(publicationId: Int, selectedButtonTag: Int, toBeSelectedButtonTag: Int, textTableViewCell: TextTableViewCell)
}

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: CustomContentLabel!
    @IBOutlet weak var publicationTextLabel: CustomContentLabel!
    @IBOutlet weak var firstReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var secondReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var thirdReactionCountLabel: CustomContentLabel!
    @IBOutlet weak var fourthReactionCountLabel: CustomContentLabel!
    @IBOutlet var reactionButtonCollection: [MySuperCustomButton]!
    weak var textHomeCellDelegate : TextHomeCellDelegate?
    var publicationIdD: Int = 0
    
    var selectedButtonTag: Int = 0
    var toBeSelectedButtonTag: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        
    }
    
    func setUp(publicationId: Int, img: String, fullName: String, publicationText: String, publicationReaction: PublicationReaction, textHomeCellDelegate : TextHomeCellDelegate) {
        publicationIdD = publicationId
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
        self.textHomeCellDelegate = textHomeCellDelegate
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
        textHomeCellDelegate?.increaseCounter(publicationId: publicationIdD, selectedButtonTag: selectedButtonTag, toBeSelectedButtonTag: toBeSelectedButtonTag, textTableViewCell: self)
    }
}


//TODO: Move it from here
class MySuperCustomButton : UIButton {
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .clear : .clear
        }
    }
}
