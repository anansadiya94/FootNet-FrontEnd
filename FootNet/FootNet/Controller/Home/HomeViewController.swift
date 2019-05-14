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
        for texHomeCellResponse in Constants.texHomeCellsResponse {
            if let user = Constants.usersBasicInfo.filter({$0.id == texHomeCellResponse.userId && $0.amIFollowing == true}).first {
                displayTexHomeCells.append(
                    DisplayTextHomeCell(userId: texHomeCellResponse.userId, publicationId: texHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationText: texHomeCellResponse.publicationText, publicationReaction: texHomeCellResponse.publicationReaction)
                )
            }
        }
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
                    mutableModel.publicationReaction.firstReactionCount -= 1
                case 2:
                    mutableModel.publicationReaction.secondReactionCount -= 1
                case 3:
                    mutableModel.publicationReaction.thirdReactionCount -= 1
                case 4:
                    mutableModel.publicationReaction.fourthReactionCount -= 1
                default:
                    break
                }
                switch toBeSelectedButtonTag {
                case 0:
                    break
                case 1:
                    mutableModel.publicationReaction.firstReactionCount += 1
                case 2:
                    mutableModel.publicationReaction.secondReactionCount += 1
                case 3:
                    mutableModel.publicationReaction.thirdReactionCount += 1
                case 4:
                    mutableModel.publicationReaction.fourthReactionCount += 1
                default:
                    break
                }
            }
            return mutableModel
        }
        
        //TODO: FIX RELOAD ROWS AT
//        guard let indexPath = self.tableView.indexPath(for: textTableViewCell) else {return}
//        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.reloadData()
    }
}
