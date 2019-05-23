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
    @IBOutlet weak var firstReactionView: UIView!
    @IBOutlet weak var secondReactionView: UIView!
    @IBOutlet weak var thirdReactionView: UIView!
    @IBOutlet weak var fourthReactionView: UIView!
    
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
        var x = 0
        var y = 0
        switch tag {
        case 1:
            imageName = "top.png"
            x = Int(self.firstReactionView.center.x)
            y = Int(self.firstReactionView.center.y)
        case 2:
            imageName = "fire.png"
            x = Int(self.secondReactionView.center.x)
            y = Int(self.secondReactionView.center.y)
        case 3:
            imageName = "trophy.png"
            x = Int(self.thirdReactionView.center.x)
            y = Int(self.thirdReactionView.center.y)
        case 4:
            imageName = "medal.png"
            x = Int(self.fourthReactionView.center.x)
            y = Int(self.fourthReactionView.center.y)
        default:
            break
        }
        
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: x, y: y, width: 50, height: 50)
        self.addSubview(imageView)
        imageView.animate(inParallel: [
            .fadeIn(duration: 2),
            .resize(to: CGSize(width: 200, height: 200), duration: 2),
            .move(byX: 0.0, y: 50.0, duration: 2),
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
