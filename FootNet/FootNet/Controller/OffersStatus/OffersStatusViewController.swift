//
//  OffersStatusViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var acceptedDisplayOfferStatusCell = [DisplayOfferStatusCell]()
    var pendingDisplayOfferStatusCell = [DisplayOfferStatusCell]()
    var rejectedDisplayOfferStatusCell = [DisplayOfferStatusCell]()
    private var dataSource: [DisplayOfferStatusCell]?

    @IBOutlet weak var scSegment: UISegmentedControl!
    @IBOutlet weak var offersStatusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        getOffersStatusData()
        setSegmentControl()
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "offersStatusTabBar".localize()
    }
    
    private func setSegmentControl() {
        scSegment.tintColor = UIColor.colorSecondary
        scSegment.setTitle("acceptedOffers_scTitle".localize(), forSegmentAt: 0)
        scSegment.setTitle("pendingOffers_scTitle".localize(), forSegmentAt: 1)
        scSegment.setTitle("rejectedOffers_scTitle".localize(), forSegmentAt: 2)
        scSegment.selectedSegmentIndex = 1
        dataSource = pendingDisplayOfferStatusCell
        offersStatusTableView.reloadData()
    }
    
    private func getOffersStatusData() {
        for offerCellResponse in StaticDBManager.shared.requestOffers() {
            if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == offerCellResponse.userId}).first {
                switch offerCellResponse.offerStatus {
                case .NotRequested:
                    break
                case .Accepted:
                    acceptedDisplayOfferStatusCell.append(DisplayOfferStatusCell(userImage: UIImage(named: user.photo)!, offerStatusDetail: user.fullName + "acceptedOffers_detail".localize() + offerCellResponse.offerTitle + "."))
                case .Pending:
                    pendingDisplayOfferStatusCell.append(DisplayOfferStatusCell(userImage: UIImage(named: user.photo)!, offerStatusDetail: user.fullName + "pendingOffers_detail".localize() + offerCellResponse.offerTitle + "."))
                case .Rejected:
                    rejectedDisplayOfferStatusCell.append(DisplayOfferStatusCell(userImage: UIImage(named: user.photo)!, offerStatusDetail: user.fullName + "rejectedOffers_detail".localize() + offerCellResponse.offerTitle + "."))
                }
            }
        }
    }
    
    @IBAction func scSegmentTapped(_ sender: Any) {
        switch scSegment.selectedSegmentIndex {
        case 0:
            dataSource = acceptedDisplayOfferStatusCell
        case 1:
            dataSource = pendingDisplayOfferStatusCell
        case 2:
            dataSource = rejectedDisplayOfferStatusCell
        default:
            break
        }
        offersStatusTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offersStatusCell", for: indexPath) as! OffersStatusTableViewCell
        guard dataSource != nil else { return OffersStatusTableViewCell() }
        let model = dataSource![indexPath.row]
        cell.userImageView.image = model.userImage
        cell.offerStatusDetailLabel.text = model.offerStatusDetail
        return cell
    }
}
