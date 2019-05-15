//
//  HomeViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var publishButton: CustomPublishButton!
    @IBOutlet weak var tableView: UITableView!
    
    var displayTexHomeCells = [DisplayTextHomeCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setPublishButton()
        registerNib()
        generateDisplayTextHomeCells()
    }

    private func generateDisplayTextHomeCells() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        for texHomeCellResponse in Constants.texHomeCellsResponse {
            if let user = Constants.usersBasicInfo.filter({$0.id == texHomeCellResponse.userId && $0.amIFollowing == true}).first {
                displayTexHomeCells.append(
                    DisplayTextHomeCell(homeCellType: texHomeCellResponse.homeCellType, userId: texHomeCellResponse.userId, publicationId: texHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationText: texHomeCellResponse.publicationText, publicationDate: dateFormatter.date(from: texHomeCellResponse.publicationDate)!, publicationReaction: texHomeCellResponse.publicationReaction)
                )
            }
        }
        displayTexHomeCells = displayTexHomeCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "homeTabBar".localize()
    }
    
    private func setPublishButton() {
        publishButton.setTitle("publish_button".localize(), for: .normal)
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "OfferCustomCell", bundle: nil), forCellReuseIdentifier: "offerCustomCell")
        tableView.register(UINib(nibName: "TextCustomCell", bundle: nil), forCellReuseIdentifier: "textCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayTexHomeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCustomCell") as! TextTableViewCell
        cell.setUp(publicationId: displayTexHomeCells[indexPath.row].publicationId, img: displayTexHomeCells[indexPath.row].photo, fullName: displayTexHomeCells[indexPath.row].fullName, publicationText: displayTexHomeCells[indexPath.row].publicationText, publicationReaction: displayTexHomeCells[indexPath.row].publicationReaction, texHomeCellDelegate: self)
        return cell
    }
}

extension HomeViewController: TexHomeCellDelegate {
    func increaseCounter(publicationId: Int, selectedButtonTag: Int, toBeSelectedButtonTag: Int, textTableViewCell: TextTableViewCell) {
        self.displayTexHomeCells = displayTexHomeCells.map { (model: DisplayTextHomeCell) -> DisplayTextHomeCell in
            var mutableModel = model
            if mutableModel.publicationId == publicationId {
                switch selectedButtonTag {
                case 0:
                    break
                case 1:
                    mutableModel.publicationReaction.firstReactionCount.reactionCount -= 1
                    mutableModel.publicationReaction.firstReactionCount.reactionStatus = false
                case 2:
                    mutableModel.publicationReaction.secondReactionCount.reactionCount -= 1
                    mutableModel.publicationReaction.secondReactionCount.reactionStatus = false
                case 3:
                    mutableModel.publicationReaction.thirdReactionCount.reactionCount -= 1
                    mutableModel.publicationReaction.thirdReactionCount.reactionStatus = false
                case 4:
                    mutableModel.publicationReaction.fourthReactionCount.reactionCount -= 1
                    mutableModel.publicationReaction.fourthReactionCount.reactionStatus = false
                default:
                    break
                }
                switch toBeSelectedButtonTag {
                case 0:
                    break
                case 1:
                    mutableModel.publicationReaction.firstReactionCount.reactionCount += 1
                    mutableModel.publicationReaction.firstReactionCount.reactionStatus = true
                case 2:
                    mutableModel.publicationReaction.secondReactionCount.reactionCount += 1
                    mutableModel.publicationReaction.secondReactionCount.reactionStatus = true
                case 3:
                    mutableModel.publicationReaction.thirdReactionCount.reactionCount += 1
                    mutableModel.publicationReaction.thirdReactionCount.reactionStatus = true
                case 4:
                    mutableModel.publicationReaction.fourthReactionCount.reactionCount += 1
                    mutableModel.publicationReaction.fourthReactionCount.reactionStatus = true
                default:
                    break
                }
            }
            return mutableModel
        }
        
        guard let indexPath = self.tableView.indexPath(for: textTableViewCell) else {return}
        UIView.performWithoutAnimation {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
