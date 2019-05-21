//
//  SearchViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var displayUsers = [DisplaySearchedUser]()
    var filteredDisplayUsers = [DisplaySearchedUser]()
    var searching: Bool = false
    var searchTextString: String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setSearchBar()
        generateDisplayUsers()
    }

    private func setTabBarItem() {
        tabBarItem.title = "searchTabBar".localize()
    }
    
    private func setSearchBar() {
        searchBar.delegate = self as UISearchBarDelegate
        searchBar.tintColor = UIColor.colorPrimary
        searchBar.barTintColor = UIColor.colorSecondary
        searchBar.keyboardAppearance = .dark
    }
    
    private func generateDisplayUsers() {
        for user in StaticDBManager.shared.requestUsers() {
            displayUsers.append(
                DisplaySearchedUser(id: user.id, fullName: user.name + " " + user.surname , photo: user.photo, amIFollowing: user.amIFollowing)
            )
        }
        displayUsers.sort() { $0.fullName.lowercased() < $1.fullName.lowercased() }
    }
    
    @IBAction func customFollowButtonTapped(_ sender: CustomFollowButton) {
        displayUsers = displayUsers.map {
            var displayUser = $0
            if $0.id == sender.tag {
                displayUser.amIFollowing = !displayUser.amIFollowing
            }
            return displayUser
        }
        if searching {
            filteredDisplayUsers = generatefilteredDisplayUsers(displayUsers, searchTextString)
        }
        resultsTableView.reloadData()
    }
    
    func generatefilteredDisplayUsers(_ displayUsers: [DisplaySearchedUser], _ searchText: String) -> [DisplaySearchedUser]{
        return displayUsers.filter({$0.fullName.lowercased().prefix(searchText.count) == searchText.lowercased()})
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredDisplayUsers.count
        } else {
            return displayUsers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        if searching {
            cell.setUp(img: filteredDisplayUsers[indexPath.row].photo, fullName: filteredDisplayUsers[indexPath.row].fullName, amIFollowing: filteredDisplayUsers[indexPath.row].amIFollowing)
            cell.seachedProfileStatusButton.tag = filteredDisplayUsers[indexPath.row].id
        } else {
            cell.setUp(img: displayUsers[indexPath.row].photo, fullName: displayUsers[indexPath.row].fullName, amIFollowing: displayUsers[indexPath.row].amIFollowing)
            cell.seachedProfileStatusButton.tag = displayUsers[indexPath.row].id
        }
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        searchTextString = searchText
        filteredDisplayUsers = generatefilteredDisplayUsers(displayUsers, searchTextString)
        resultsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        resultsTableView.reloadData()
    }
}
