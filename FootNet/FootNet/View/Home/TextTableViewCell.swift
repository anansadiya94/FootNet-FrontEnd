//
//  TextTableViewCell.swift
//  FootNet
//
//  Created by Anan Sadiya on 03/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: CustomImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var topButtonLabel: UILabel!
    @IBOutlet weak var fireButtonLabel: UILabel!
    @IBOutlet weak var trophyButtonLabel: UILabel!
    @IBOutlet weak var medalButtonLabel: UILabel!
    
    @IBOutlet var reactionButtonCollection: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        reactionButtonCollection.forEach { (button) in
            button.isEnabled = button == sender
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        nameSurnameLabel.textColor = UIColor.colorText
        textPostLabel.textColor = UIColor.colorText
        topButtonLabel.textColor = UIColor.colorText
        fireButtonLabel.textColor = UIColor.colorText
        trophyButtonLabel.textColor = UIColor.colorText
        medalButtonLabel.textColor = UIColor.colorText
    }
}
