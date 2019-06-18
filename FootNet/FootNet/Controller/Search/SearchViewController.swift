//
//  SearchNavViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 18/06/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var resultsTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let lottieAnimation = LottieAnimation()
    var displayUsers = [DisplaySearchedUser]()
    var filteredDisplayUsers = [DisplaySearchedUser]()
    var searching: Bool = false
    var searchTextString: String = ""
    var userId = 0
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        setBackground()
        setTabBarItem()
        setNavigationController()
        generateDisplayUsers()
        //create lottie animation Spinner
        lottieAnimation.createLottieAnimation(view: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTabBarItem()
        setNavigationController()
        displayUsers = []
        generateDisplayUsers()
        guard let selectedIndexPath = selectedIndexPath else {return}
        resultsTableView.beginUpdates()
        resultsTableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        resultsTableView.endUpdates()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.parent?.navigationItem.searchController = nil
    }
    
    private func setTabBarItem() {
        self.parent?.title = "searchTabBar".localize()
        tabBarItem.title = "searchTabBar".localize()
    }
    
    private func generateDisplayUsers() {
        userId = Int(UserDefaults.standard.string(forKey: "signUserId")!)!
        for user in StaticDBManager.shared.requestUsers() {
            if user.id != userId {
                displayUsers.append(
                    DisplaySearchedUser(id: user.id, fullName: user.name + " " + user.surname , photo: user.photo, amIFollowing: user.amIFollowing)
                )
            }
        }
        displayUsers.sort() { $0.fullName.lowercased() < $1.fullName.lowercased() }
    }
    
    private func setNavigationController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search users"
        searchController.searchBar.barStyle = .black
        searchController.searchBar.tintColor = UIColor.colorSecondary
        searchController.searchBar.keyboardAppearance = .dark
        self.parent?.navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    @IBAction func customFollowButtonTapped(_ sender: CustomFollowButton) {
        lottieAnimation.startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            self.lottieAnimation.stopLottieAnimation()
            self.displayUsers = self.displayUsers.map {
                var displayUser = $0
                if $0.id == sender.tag {
                    displayUser.amIFollowing = !displayUser.amIFollowing
                    StaticDBManager.shared.modifyFriends(followerId: self.userId, followingId: displayUser.id, followingStatus: displayUser.amIFollowing)
                }
                return displayUser
            }
            if self.searching {
                self.filteredDisplayUsers = self.generatefilteredDisplayUsers(self.displayUsers, self.searchTextString)
            }
            self.resultsTableView.reloadData()
        }
    }
    
    func generatefilteredDisplayUsers(_ displayUsers: [DisplaySearchedUser], _ searchText: String) -> [DisplaySearchedUser]{
        return displayUsers.filter({$0.fullName.lowercased().prefix(searchText.count) == searchText.lowercased()})
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searching ? filteredDisplayUsers.count : displayUsers.count
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            searchTextString = text
            filteredDisplayUsers = generatefilteredDisplayUsers(displayUsers, searchTextString)
            searching = true
        }
        else {
            searching = false
            filteredDisplayUsers  = [DisplaySearchedUser]()
        }
        resultsTableView.reloadData()
    }
}
