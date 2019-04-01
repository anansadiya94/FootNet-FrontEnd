//
//  OffersStatusViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var acceptedOffersData = [OffersStatusModel]()
    var pendingOffersData = [OffersStatusModel]()
    var rejectedOffersData = [OffersStatusModel]()
    private var dataSource: [OffersStatusModel]?

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
        scSegment.tintColor = UIColor.colorDarkGreen
        scSegment.setTitle("acceptedOffers_scTitle".localize(), forSegmentAt: 0)
        scSegment.setTitle("pendingOffers_scTitle".localize(), forSegmentAt: 1)
        scSegment.setTitle("rejectedOffers_scTitle".localize(), forSegmentAt: 2)
        scSegment.selectedSegmentIndex = 1
        dataSource = pendingOffersData
        offersStatusTableView.reloadData()
    }
    
    private func getOffersStatusData() {
        acceptedOffersData = OffersStatusData.getAcceptedOffersData()
        pendingOffersData = OffersStatusData.getPendingOffersData()
        rejectedOffersData = OffersStatusData.getRejectedOffersData()
    }
    
    @IBAction func scSegmentTapped(_ sender: Any) {
        switch scSegment.selectedSegmentIndex {
        case 0:
            dataSource = acceptedOffersData
        case 1:
            dataSource = pendingOffersData
        case 2:
            dataSource = rejectedOffersData
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
        cell.userImage.image = model.userImage
        cell.offerStatusDetail.text = model.offerStatusDetail
        cell.offerStatusDetail.textColor = UIColor.white
        return cell
    }
}
