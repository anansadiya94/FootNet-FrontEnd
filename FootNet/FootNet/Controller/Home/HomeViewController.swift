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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setPublishButton()
        registerNib()
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCustomCell") as! TextTableViewCell
        cell.userImageView.image = #imageLiteral(resourceName: "defaultProfilePhoto")
        cell.nameSurnameLabel.text = "Alex Lopez"
        cell.textPostLabel.text = "Mañana jugamos a las 12. Venid a vernos!"
        cell.seeMoreButton.setTitle("seeMore_button".localize(), for: .normal)
        return cell
    }
}
