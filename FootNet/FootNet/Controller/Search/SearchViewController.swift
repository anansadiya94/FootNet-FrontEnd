//
//  SearchViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var displayUsers = [
        DisplaySearchedUser(id: 1, fullName: "Anan", photo: "homeRightImage", amIFollowing: true),
        DisplaySearchedUser(id: 2, fullName: "marcos", photo: "homeRightImage", amIFollowing: true),
        DisplaySearchedUser(id: 3, fullName: "hola", photo: "homeRightImage", amIFollowing: false),
        DisplaySearchedUser(id: 4, fullName: "adios", photo: "homeRightImage", amIFollowing: false)
    ]
    
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
    
    @IBAction func customFollowButtonTapped(_ sender: CustomFollowButton) {
        displayUsers = displayUsers.map{
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
