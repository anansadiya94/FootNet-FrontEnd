//
//  LeftHomeTableViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 21/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

protocol AppNavigationDrawerDelegate: class {
    func didTapSignOutButton()
}

class LeftHomeTableViewController: UITableViewController {
    weak var delegate: AppNavigationDrawerDelegate?
    @IBOutlet weak var img: CustomImageView!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var profileTypeLabel: UILabel!
    @IBOutlet weak var myProfileButton: CustomLeftHomeButton!
    @IBOutlet weak var signOutButton: CustomLeftHomeButton!
    @IBOutlet weak var deactivateAccoutButton: CustomLeftHomeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorDarkGreen
        configureOutlets()
    }
    
    private func configureOutlets() {
        //TODO Account profile photo
        img.image = #imageLiteral(resourceName: "joanet")
        
        //TODO Account name surname
        nameSurnameLabel.text = "Joan Menéndez Alaminos"
        nameSurnameLabel.textColor = UIColor.white
        
        //TODO Account profile type
        profileTypeLabel.text = "Jugador"
        profileTypeLabel.textColor = UIColor.white
        
        //TODO Localize buttons
        myProfileButton.setTitle("myProfileButton".localize(), for: .normal)
        signOutButton.setTitle("signOutButton".localize(), for: .normal)
        deactivateAccoutButton.setTitle("deactivateAccoutButton".localize(), for: .normal)
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        //TODO ALERT
        //IF NO DISMISS
        //IF YES
        //Closeleft and push signin storyboard
        delegate?.didTapSignOutButton()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
