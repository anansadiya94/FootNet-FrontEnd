//
//  OfferViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        tableView.register(UINib(nibName: "OfferCustomCell", bundle: nil), forCellReuseIdentifier: "offerCustomCell")
        tableView.backgroundColor = .clear
    }
    
    private func setTabBarItem() {
        tabBarItem.title = "offersTabBar".localize()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "offerCustomCell") as! OfferTableViewCell
        cell.userImageView.image = #imageLiteral(resourceName: "defaultProfilePhoto")
        cell.nameSurnameLabel.text = "ANAN"
        cell.offerImageView.image = #imageLiteral(resourceName: "joanet")
        cell.offerDetailLabel.text = "Se busca ..."
        cell.seeMoreButton.setTitle("See more", for: .normal)
        return cell
    }
}
