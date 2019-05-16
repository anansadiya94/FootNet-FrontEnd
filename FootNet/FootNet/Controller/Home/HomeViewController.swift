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
    
    var offersViewController = OffersViewController()
    var displayTextHomeCells = [DisplayTextHomeCell]()
    var displayPhotoHomeCells = [DisplayPhotoHomeCell]()
    var displayOfferCells = [DisplayOffercell]()
    var homeCells = [homeCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setPublishButton()
        registerNib()
        displayTextHomeCells = generateDisplayTextHomeCells()
        displayPhotoHomeCells = generateDisplayPhotoHomeCells()
        displayOfferCells = offersViewController.generateDisplayOfferCells()

        for displayTextHomeCell in displayTextHomeCells {
            homeCells.append(homeCell(homeCellType: displayTextHomeCell.homeCellType, cellId: displayTextHomeCell.publicationId, date: displayTextHomeCell.publicationDate))
        }
        
        for displayPhotoHomeCell in displayPhotoHomeCells {
            homeCells.append(homeCell(homeCellType: displayPhotoHomeCell.homeCellType, cellId: displayPhotoHomeCell.publicationId, date: displayPhotoHomeCell.publicationDate))
        }
        
        
        for displayOfferCell in displayOfferCells {
            homeCells.append(homeCell(homeCellType: displayOfferCell.homeCellType, cellId: displayOfferCell.offerId, date: displayOfferCell.publicationDate))
        }
        
        homeCells = homeCells.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        
    }

    func generateDisplayTextHomeCells() -> [DisplayTextHomeCell] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        for textHomeCellResponse in Constants.textHomeCellsResponse {
            if let user = Constants.usersBasicInfo.filter({$0.id == textHomeCellResponse.userId && $0.amIFollowing == true}).first {
                displayTextHomeCells.append(
                    DisplayTextHomeCell(userId: textHomeCellResponse.userId, publicationId: textHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationText: textHomeCellResponse.publicationText, publicationDate: dateFormatter.date(from: textHomeCellResponse.publicationDate)!, publicationReaction: textHomeCellResponse.publicationReaction)
                )
            }
        }
        displayTextHomeCells = displayTextHomeCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayTextHomeCells
    }
    
    func generateDisplayPhotoHomeCells() -> [DisplayPhotoHomeCell] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        for photoHomeCellResponse in Constants.photoHomeCellsResponse {
            if let user = Constants.usersBasicInfo.filter({$0.id == photoHomeCellResponse.userId && $0.amIFollowing == true}).first {
                displayPhotoHomeCells.append(
                    DisplayPhotoHomeCell(userId: photoHomeCellResponse.userId, publicationId: photoHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationPhoto: photoHomeCellResponse.publicationPhoto, publicationDate: dateFormatter.date(from: photoHomeCellResponse.publicationDate)!, publicationReaction: photoHomeCellResponse.publicationReaction)
                )
            }
        }
        displayPhotoHomeCells = displayPhotoHomeCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayPhotoHomeCells
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "homeTabBar".localize()
    }
    
    private func setPublishButton() {
        publishButton.setTitle("publish_button".localize(), for: .normal)
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "TextCustomCell", bundle: nil), forCellReuseIdentifier: "textCustomCell")
        tableView.register(UINib(nibName: "PhotoCustomCell", bundle: nil), forCellReuseIdentifier: "photoCustomCell")
        tableView.register(UINib(nibName: "OfferCustomCell", bundle: nil), forCellReuseIdentifier: "offerCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch homeCells[indexPath.row].homeCellType {
        case HomeCellType.Text:
            return TextTableViewCell(TableView: tableView, IndexPath: indexPath, id: homeCells[indexPath.row].cellId)
        case HomeCellType.Photo:
            return PhotoTableViewCell(TableView: tableView, IndexPath: indexPath, id: homeCells[indexPath.row].cellId)
        case HomeCellType.Offer:
            return OfferTableViewCell(TableView: tableView, IndexPath: indexPath, id: homeCells[indexPath.row].cellId)
        }
    }
    
    func TextTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCustomCell") as! TextTableViewCell
        if let displayTextHomeCell = displayTextHomeCells.filter({$0.publicationId == id}).first {
            cell.setUp(publicationId: displayTextHomeCell.publicationId, img: displayTextHomeCell.photo, fullName: displayTextHomeCell.fullName, publicationText: displayTextHomeCell.publicationText, publicationReaction: displayTextHomeCell.publicationReaction, textHomeCellDelegate: self as TextHomeCellDelegate)
        }
        return cell
    }
    
    func PhotoTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCustomCell") as! PhotoTableViewCell
        if let displayPhotoHomeCell = displayPhotoHomeCells.filter({$0.publicationId == id}).first {
            cell.setUp(publicationId: displayPhotoHomeCell.publicationId, img: displayPhotoHomeCell.photo, fullName: displayPhotoHomeCell.fullName, publicationPhoto: displayPhotoHomeCell.publicationPhoto, publicationReaction: displayPhotoHomeCell.publicationReaction, photoHomeCellDelegate: self as PhotoHomeCellDelegate)
        }
        return cell
    }
    
    func OfferTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerCustomCell") as! OfferTableViewCell
        if let displayOfferCell = displayOfferCells.filter({$0.offerId == id}).first {
            cell.setUp(img: displayOfferCell.photo, fullName: displayOfferCell.fullName, offerImg: displayOfferCell.offerPhoto, offerTitle: displayOfferCell.offerTitle)
        }
        return cell
    }
}

extension HomeViewController: TextHomeCellDelegate {
    func increaseCounter(publicationId: Int, selectedButtonTag: Int, toBeSelectedButtonTag: Int, textTableViewCell: TextTableViewCell) {
        self.displayTextHomeCells = displayTextHomeCells.map { (model: DisplayTextHomeCell) -> DisplayTextHomeCell in
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

extension HomeViewController: PhotoHomeCellDelegate {
    func increaseCounter(publicationId: Int, selectedButtonTag: Int, toBeSelectedButtonTag: Int, photoTableViewCell: PhotoTableViewCell) {
        self.displayPhotoHomeCells = displayPhotoHomeCells.map { (model: DisplayPhotoHomeCell) -> DisplayPhotoHomeCell in
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
        
        guard let indexPath = self.tableView.indexPath(for: photoTableViewCell) else {return}
        UIView.performWithoutAnimation {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
