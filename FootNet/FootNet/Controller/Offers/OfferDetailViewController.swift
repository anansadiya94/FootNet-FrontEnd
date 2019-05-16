//
//  OfferDetailViewController.swift
//  FootNet
//
//  Created by Anan Sadiya on 16/05/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {
    
    var offersViewController = OffersViewController()
    var displayOfferCells = [DisplayOffercell]()
    var id: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        displayOfferCells = offersViewController.generateDisplayOfferCells()
        print(id)
    }
}

