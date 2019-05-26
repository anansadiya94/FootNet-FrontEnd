//
//  MyFriendsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var followersData = [DisplayUserBasicInfo]()
    var followingData = [DisplayUserBasicInfo]()
    private var dataSource: [DisplayUserBasicInfo]?
    
    @IBOutlet weak var scSegment: UISegmentedControl!
    @IBOutlet weak var myFriendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        followersData = generateDisplayFollowersData()
        followingData = generateDisplayFollowingData()
        setTabBarItem()
        setSegmentControl()
    }
    
    private func setTabBarItem() {
        title = "myFriendsLabel".localize()
    }
    
    private func setSegmentControl() {
        scSegment.tintColor = UIColor.colorSecondary
        scSegment.setTitle("followers_scTitle".localize(), forSegmentAt: 0)
        scSegment.setTitle("following_scTitle".localize(), forSegmentAt: 1)
        scSegment.selectedSegmentIndex = 0
        dataSource = followersData
        myFriendsTableView.reloadData()
    }
    
    private func generateDisplayFollowersData() -> [DisplayUserBasicInfo] {
        for user in StaticDBManager.shared.requestUsers() {
            followersData.append(
                DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname , photo: user.photo, amIFollowing: user.amIFollowing)
            )
        }
        followersData.sort() { $0.fullName.lowercased() < $1.fullName.lowercased() }
        return followersData
    }
    
    private func generateDisplayFollowingData() -> [DisplayUserBasicInfo] {
        for user in StaticDBManager.shared.requestUsers() {
            followingData.append(
                DisplayUserBasicInfo(id: user.id, fullName: user.name + " " + user.surname , photo: user.photo, amIFollowing: user.amIFollowing)
            )
        }
        followingData.sort() { $0.fullName.lowercased() < $1.fullName.lowercased() }
        return followingData
    }
    
    @IBAction func scSegmentTapped(_ sender: Any) {
        switch scSegment.selectedSegmentIndex {
        case 0:
            dataSource = followersData
        case 1:
            dataSource = followingData
        default:
            break
        }
        myFriendsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendCell", for: indexPath) as! MyFriendTableViewCell
        guard dataSource != nil else { return MyFriendTableViewCell() }
        let model = dataSource![indexPath.row]
        cell.setUp(img: model.photo, fullName: model.fullName, amIFollowing: model.amIFollowing)
        return cell
    }
}
