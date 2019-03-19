//
//  MainController.swift
//  FootNet
//
//  Created by Anan Sadiya on 14/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack
import Material

protocol AppNavigationDrawerDelegate: class {
    func didTapHomeLeftButton()
    func didTapHomeRightButton()
}

class MainTabBarViewController: BaseViewController {
    weak var delegate: AppNavigationDrawerDelegate?
    @IBOutlet weak var homeLeftButtom: UIBarButtonItem!
    @IBOutlet weak var homeRightButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHomeLeftButton()
        setHomeRightButton()
    }
    
    private func setHomeLeftButton() {
        homeLeftButtom.tintColor = UIColor.white
    }
    
    private func setHomeRightButton() {
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(homeRightTapped), for: .touchUpInside)
        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
        infoBarButtonItem.customView?.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    
    @IBAction func homeLeftTapped(_ sender: Any) {
        delegate?.didTapHomeLeftButton()
    }
    
    @IBAction func homeRightTapped(_ sender: Any) {
        delegate?.didTapHomeRightButton()
    }
}
    

