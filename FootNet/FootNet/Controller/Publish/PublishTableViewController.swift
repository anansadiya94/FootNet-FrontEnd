//
//  PublishTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class PublishTableViewController: UITableViewController {
    var displayPublishCell = [DisplayPublishCell]()
    private var profileType: HomeCellType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        displayPublishCell = [
            DisplayPublishCell(img: "offersTabBar", title: "publish_offer".localize(), type: .Offer),
            DisplayPublishCell(img: "publishText", title: "publish_text".localize(), type: .Text),
            DisplayPublishCell(img: "publishPhoto", title: "publish_photo".localize(), type: .Photo),
        ]
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayPublishCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "publishCell", for: indexPath) as! PublishTableViewCell
        cell.img.image = UIImage(named: displayPublishCell[indexPath.row].img)
        cell.lbl.text = displayPublishCell[indexPath.row].title
        return cell
    }
    
    //cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //section title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = "publish_sectionHeader".localize()
        return section
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let publishOfferStoryboard = UIStoryboard(name: "PublishOffer", bundle: nil)
            let publishOfferTableViewController = publishOfferStoryboard.instantiateViewController(withIdentifier: "PublishOfferTableViewController")
            title = " "
            navigationController?.pushViewController(publishOfferTableViewController, animated: true)
        case 1:
            let publishOfferStoryboard = UIStoryboard(name: "PublishText", bundle: nil)
            let publishOfferTableViewController = publishOfferStoryboard.instantiateViewController(withIdentifier: "PublishTextTableViewController")
            title = " "
            navigationController?.pushViewController(publishOfferTableViewController, animated: true)
        case 2:
            let publishOfferStoryboard = UIStoryboard(name: "PublishPhoto", bundle: nil)
            let publishOfferTableViewController = publishOfferStoryboard.instantiateViewController(withIdentifier: "PublishPhotoTableViewController")
            title = " "
            navigationController?.pushViewController(publishOfferTableViewController, animated: true)
        default:
            return
        }
    }
}
