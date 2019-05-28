//
//  MyFriendsViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 25/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController {
    var followersData = [DisplayUserBasicInfo]()
    var followingData = [DisplayUserBasicInfo]()
    private var dataSource: [DisplayUserBasicInfo]?
    
    @IBOutlet weak var scSegment: UISegmentedControl!
    @IBOutlet weak var myFriendsTableView: UITableView!
    
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
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
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        for friend in StaticDBManager.shared.requestFriends() {
            if friend.followingId == userId {
                if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == friend.followerId}).first {
                    followersData.append(
                        DisplayUserBasicInfo(id: user.id, fullName: user.fullName , photo: user.photo, amIFollowing: user.amIFollowing)
                    )
                }
            }
        }
        followersData.sort() { $0.fullName.lowercased() < $1.fullName.lowercased() }
        return followersData
    }
    
    private func generateDisplayFollowingData() -> [DisplayUserBasicInfo] {
        let userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)
        for friend in StaticDBManager.shared.requestFriends() {
            if friend.followerId == userId {
                if let user = StaticDBManager.shared.requestUsersBasicInfo().filter({$0.id == friend.followingId}).first {
                    followingData.append(
                        DisplayUserBasicInfo(id: user.id, fullName: user.fullName , photo: user.photo, amIFollowing: user.amIFollowing)
                    )
                }
            }
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
}

extension MyFriendsViewController: UITableViewDelegate, UITableViewDataSource {
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
