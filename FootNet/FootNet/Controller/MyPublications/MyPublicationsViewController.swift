//
//  MyPublicationsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyPublicationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var displayTextHomeCells = [DisplayTextHomeCell]()
    var displayPhotoHomeCells = [DisplayPhotoHomeCell]()
    var displayOfferCells = [DisplayOffercell]()
    var myPublicationsCells = [HomeCell]()
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        setBackground()
        setTabBarItem()
        registerNib()
        displayTextHomeCells = generateDisplayTextHomeCells()
        displayPhotoHomeCells = generateDisplayPhotoHomeCells()
        displayOfferCells = generateDisplayOfferCells()
        myPublicationsCells = generateMyPublicationsCells()
    }
    
    private func setTabBarItem() {
        title = "myPublicationsLabel".localize()
    }
    
    func generateDisplayTextHomeCells() -> [DisplayTextHomeCell] {
        for textHomeCellResponse in StaticDBManager.shared.requestTextPublications() {
            if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == textHomeCellResponse.userId}).first {
                displayTextHomeCells.append(
                    DisplayTextHomeCell(userId: textHomeCellResponse.userId, publicationId: textHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationText: textHomeCellResponse.publicationText, publicationDate: textHomeCellResponse.publicationDate, publicationReaction: textHomeCellResponse.publicationReaction)
                )
            }
        }
        displayTextHomeCells = displayTextHomeCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayTextHomeCells
    }
    
    func generateDisplayPhotoHomeCells() -> [DisplayPhotoHomeCell] {
        for photoHomeCellResponse in StaticDBManager.shared.requestPhotoPublications() {
            if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == photoHomeCellResponse.userId}).first {
                displayPhotoHomeCells.append(
                    DisplayPhotoHomeCell(userId: photoHomeCellResponse.userId, publicationId: photoHomeCellResponse.publicationId, fullName: user.fullName, photo: user.photo, publicationPhoto: photoHomeCellResponse.publicationPhoto, publicationDate: photoHomeCellResponse.publicationDate, publicationReaction: photoHomeCellResponse.publicationReaction)
                )
            }
        }
        displayPhotoHomeCells = displayPhotoHomeCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayPhotoHomeCells
    }
    
    //TODO: REFACTOR FUNCTION WITH OFFERSVIEWCONTROLLER
    func generateDisplayOfferCells() -> [DisplayOffercell] {
        for offerCellResponse in StaticDBManager.shared.requestOffers() {
            if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == offerCellResponse.userId}).first {
                displayOfferCells.append(
                    DisplayOffercell(userId: offerCellResponse.userId, offerId: offerCellResponse.offerId, fullName: user.fullName, photo: user.photo, offerTitle: offerCellResponse.offerTitle, offerText: offerCellResponse.offerText, offerPhoto: offerCellResponse.offerPhoto, publicationDate: offerCellResponse.publicationDate, offerRequested: offerCellResponse.offerRequested, offerStatus: offerCellResponse.offerStatus)
                )
            }
        }
        displayOfferCells = displayOfferCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayOfferCells
    }
    
    func generateMyPublicationsCells() -> [HomeCell] {
        for displayTextHomeCell in displayTextHomeCells {
            if (displayTextHomeCell.userId == userId) {
                myPublicationsCells.append(HomeCell(homeCellType: displayTextHomeCell.homeCellType, cellId: displayTextHomeCell.publicationId, date: displayTextHomeCell.publicationDate))
            }
            
        }
        for displayPhotoHomeCell in displayPhotoHomeCells {
            if (displayPhotoHomeCell.userId == userId) {
                myPublicationsCells.append(HomeCell(homeCellType: displayPhotoHomeCell.homeCellType, cellId: displayPhotoHomeCell.publicationId, date: displayPhotoHomeCell.publicationDate))
            }
        }
        for displayOfferCell in displayOfferCells {
            if (displayOfferCell.userId == userId) {
                myPublicationsCells.append(HomeCell(homeCellType: displayOfferCell.homeCellType, cellId: displayOfferCell.offerId, date: displayOfferCell.publicationDate))
            }
        }
        myPublicationsCells = myPublicationsCells.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        return myPublicationsCells
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "MyTextCustomCell", bundle: nil), forCellReuseIdentifier: "myTextCustomCell")
        tableView.register(UINib(nibName: "MyPhotoCustomCell", bundle: nil), forCellReuseIdentifier: "myPhotoCustomCell")
        tableView.register(UINib(nibName: "MyOfferCustomCell", bundle: nil), forCellReuseIdentifier: "myOfferCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPublicationsCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch myPublicationsCells[indexPath.row].homeCellType {
        case HomeCellType.Text:
            return TextTableViewCell(TableView: tableView, IndexPath: indexPath, id: myPublicationsCells[indexPath.row].cellId)
        case HomeCellType.Photo:
            return PhotoTableViewCell(TableView: tableView, IndexPath: indexPath, id: myPublicationsCells[indexPath.row].cellId)
        case HomeCellType.Offer:
            return OfferTableViewCell(TableView: tableView, IndexPath: indexPath, id: myPublicationsCells[indexPath.row].cellId)
        }
    }
    
    func TextTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTextCustomCell") as! MyTextTableViewCell
        if let displayTextHomeCell = displayTextHomeCells.filter({$0.publicationId == id}).first {
            cell.setUp(publicationId: displayTextHomeCell.publicationId, img: displayTextHomeCell.photo, fullName: displayTextHomeCell.fullName, publicationText: displayTextHomeCell.publicationText, publicationReaction: displayTextHomeCell.publicationReaction)
        }
        return cell
    }
    
    func PhotoTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPhotoCustomCell") as! MyPhotoTableViewCell
        if let displayPhotoHomeCell = displayPhotoHomeCells.filter({$0.publicationId == id}).first {
            cell.setUp(publicationId: displayPhotoHomeCell.publicationId, img: displayPhotoHomeCell.photo, fullName: displayPhotoHomeCell.fullName, publicationPhoto: displayPhotoHomeCell.publicationPhoto, publicationReaction: displayPhotoHomeCell.publicationReaction)
        }
        return cell
    }
    
    func OfferTableViewCell(TableView tableView: UITableView, IndexPath indexPath: IndexPath, id: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myOfferCustomCell") as! MyOfferTableViewCell
        if let displayOfferCell = displayOfferCells.filter({$0.offerId == id}).first {
            cell.setUp(offerId: displayOfferCell.offerId, img: displayOfferCell.photo, fullName: displayOfferCell.fullName, offerImg: displayOfferCell.offerPhoto, offerTitle: displayOfferCell.offerTitle, offerText: displayOfferCell.offerText)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch myPublicationsCells[indexPath.row].homeCellType {
        case HomeCellType.Text:
            let cell = tableView.cellForRow(at: indexPath) as! MyTextTableViewCell
            let publication = displayTextHomeCells.filter({$0.publicationId == cell.publicationId}).first
            StaticDBManager.shared.removeTextHomeCellResponse(userId: userId, publicationId: publication!.publicationId)
        case HomeCellType.Photo:
            let cell = tableView.cellForRow(at: indexPath) as! MyPhotoTableViewCell
            let publication = displayPhotoHomeCells.filter({$0.publicationId == cell.publicationId}).first
            StaticDBManager.shared.removePhotoHomeCellResponse(userId: userId, publicationId: publication!.publicationId)
        case HomeCellType.Offer:
            let cell = tableView.cellForRow(at: indexPath) as! MyOfferTableViewCell
            let publication = displayOfferCells.filter({$0.offerId == cell.publicationId}).first
            StaticDBManager.shared.removeOfferCellResponse(userId: userId, publicationId: publication!.offerId)
        }
        if editingStyle == UITableViewCell.EditingStyle.delete {
            myPublicationsCells.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
