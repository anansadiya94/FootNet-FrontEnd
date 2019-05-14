//
//  TextTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 09/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol TexHomeCellDelegate : class {
    func increaseCounter(publicationId: Int, buttonTag: Int, textTableViewCell: TextTableViewCell)
}

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var publicationTextLabel: UILabel!
    @IBOutlet weak var firstReactionCountLabel: UILabel!
    @IBOutlet weak var secondReactionCountLabel: UILabel!
    @IBOutlet weak var thirdReactionCountLabel: UILabel!
    @IBOutlet weak var fourthReactionCountLabel: UILabel!
    @IBOutlet var reactionButtonCollection: [MySuperCustomButton]!
    weak var texHomeCellDelegate : TexHomeCellDelegate?
    var publicationIdD: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        fullNameLabel.textColor = UIColor.colorText
        publicationTextLabel.textColor = UIColor.colorText
        firstReactionCountLabel.textColor = UIColor.colorText
        secondReactionCountLabel.textColor = UIColor.colorText
        thirdReactionCountLabel.textColor = UIColor.colorText
        fourthReactionCountLabel.textColor = UIColor.colorText
        
    }
    
    func setUp(publicationId: Int, img: String, fullName: String, publicationText: String, publicationReaction: PublicationReaction, texHomeCellDelegate : TexHomeCellDelegate) {
        publicationIdD = publicationId
        userImageView.image = UIImage(named: img)
        fullNameLabel.text = fullName
        publicationTextLabel.text = publicationText
        firstReactionCountLabel.text = String(publicationReaction.firstReactionCount)
        secondReactionCountLabel.text = String(publicationReaction.secondReactionCount)
        thirdReactionCountLabel.text = String(publicationReaction.thirdReactionCount)
        fourthReactionCountLabel.text = String(publicationReaction.fourthReactionCount)
        self.texHomeCellDelegate = texHomeCellDelegate
    }
    
    func updateValues(first : Int) {
        
    }
    
    @IBAction func buttonPressed(_ sender: MySuperCustomButton) {
        //Button selected or not
        reactionButtonCollection.forEach { (button) in
            button.isSelected = button == sender
        }
        sender.isSelected = true
        
        //change count
        texHomeCellDelegate?.increaseCounter(publicationId: publicationIdD, buttonTag: sender.tag, textTableViewCell: self)
    }
}


//TODO: Move it from here
class MySuperCustomButton : UIButton {
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .yellow : .clear
        }
    }
}
