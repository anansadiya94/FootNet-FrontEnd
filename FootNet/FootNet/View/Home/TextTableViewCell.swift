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
        animateReactedButton(tag: sender.tag)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let selectedButton = self.reactionButtonCollection.filter({$0.isSelected == true}).first {
                self.selectedButtonTag = selectedButton.tag
            }
            
            self.reactionButtonCollection.forEach { (button) in
                button.isSelected = button == sender
            }
            sender.isSelected = true
            self.toBeSelectedButtonTag = sender.tag
            self.textHomeCellDelegate?.increaseCounter(publicationId: self.publicationIdD, selectedButtonTag: self.selectedButtonTag, toBeSelectedButtonTag: self.toBeSelectedButtonTag, textTableViewCell: self)
        }
    }
}

extension TextTableViewCell {
    private func animateReactedButton(tag: Int) {
        var imageName = ""
        switch tag {
        case 1:
            imageName = "top.png"
        case 2:
            imageName = "fire.png"
        case 3:
            imageName = "trophy.png"
        case 4:
            imageName = "medal.png"
        default:
            break
        }
        
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.addSubview(imageView)
        imageView.animate(inParallel: [
            .fadeIn(duration: 2),
            .resize(to: CGSize(width: 200, height: 200), duration: 2),
            .move(byX: 50.0, y: 50.0, duration: 2),
            .fadeOut(duration: 2)
        ])
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
