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

protocol AppNavigationDrawerDelegate : class {
    func didTapAwesomeButton()
}

class HomeViewController: BaseViewController {
    weak var delegate: AppNavigationDrawerDelegate?
    @IBOutlet weak var menuButtom: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButtom.tintColor = UIColor.white
    }
    
    @IBAction func homeLeftTapped(_ sender: Any) {
        delegate?.didTapAwesomeButton()
    }
}
