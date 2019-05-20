//
//  OfferViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var filterButton: CustomFilterButton!
    @IBOutlet weak var tableView: UITableView!
    
    var displayOfferCells = [DisplayOffercell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setFilterButton()
        registerNib()
        displayOfferCells = generateDisplayOfferCells()
    }
    
    func generateDisplayOfferCells() -> [DisplayOffercell] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        for offerCellResponse in ConstantsManager.shared.requestOffers() {
            if let user = Constants.usersBasicInfo.filter({$0.id == offerCellResponse.userId}).first {
                displayOfferCells.append(
                    DisplayOffercell(userId: offerCellResponse.userId, offerId: offerCellResponse.offerId, fullName: user.fullName, photo: user.photo, offerTitle: offerCellResponse.offerTitle, offerText: offerCellResponse.offerText, offerPhoto: offerCellResponse.offerPhoto, publicationDate: dateFormatter.date(from: offerCellResponse.publicationDate)!, offerRequested: offerCellResponse.offerRequested, offerStatus: offerCellResponse.offerStatus)
                )
            }
        }
        displayOfferCells = displayOfferCells.sorted(by: { $0.publicationDate.compare($1.publicationDate) == .orderedDescending })
        return displayOfferCells
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "offersTabBar".localize()
    }
    
    private func setFilterButton() {
        filterButton.setTitle("filter_button".localize(), for: .normal)
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "OfferCustomCell", bundle: nil), forCellReuseIdentifier: "offerCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayOfferCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "offerCustomCell") as! OfferTableViewCell
        cell.setUp(offerId: displayOfferCells[indexPath.row].offerId, img: displayOfferCells[indexPath.row].photo, fullName: displayOfferCells[indexPath.row].fullName, offerImg: displayOfferCells[indexPath.row].offerPhoto, offerTitle: displayOfferCells[indexPath.row].offerTitle, offerCellDelegate: self)
        return cell
    }
}

extension OffersViewController: OfferCellDelegate {
    func seeMoreButtonTapped(offerId: Int) {
        if let displayOfferCell = displayOfferCells.filter({$0.offerId == offerId}).first {
            let offerDetailStoryboard = UIStoryboard(name: "OfferDetail", bundle: nil)
            let offerDetailViewController = offerDetailStoryboard.instantiateViewController(withIdentifier: "OfferDetailViewController") as! OfferDetailViewController
            offerDetailViewController.offerId = displayOfferCell.offerId
            title = " "
            self.navigationController?.pushViewController(offerDetailViewController, animated: true)
        }
    }
}
