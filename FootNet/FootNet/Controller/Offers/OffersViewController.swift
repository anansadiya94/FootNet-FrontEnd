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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setFilterButton()
        registerNib()
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "offerCustomCell") as! OfferTableViewCell
        cell.userImageView.image = #imageLiteral(resourceName: "defaultProfilePhoto")
        cell.nameSurnameLabel.text = "Alex Lopez"
        cell.offerImageView.image = #imageLiteral(resourceName: "offerPhoto")
        cell.offerDetailLabel.text = "Se busca un jugador para tercera catalana"
        cell.seeMoreButton.setTitle("seeMore_button".localize(), for: .normal)
        return cell
    }
}
