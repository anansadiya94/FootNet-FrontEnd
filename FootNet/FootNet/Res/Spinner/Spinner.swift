//
//  Spinner.swift
//  FootNet
//
//  Created by Anan Sadiya on 19/03/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

class Spinner {
    var activityIndicator = UIActivityIndicatorView()
    
    func startSpinner(){
        activityIndicator.startAnimating()
    }
    
    func stopSpinner(){
        activityIndicator.removeFromSuperview()
    }
    
    func createSpinner(view: UIView) {
        // Create the Activity Indicator
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.transform = CGAffineTransform(scaleX: 4, y: 4)
        // Add it to the view where you want it to appear
        view.addSubview(activityIndicator)
        // Set up its size (the super view bounds usually)
        activityIndicator.frame = view.bounds
    }
}
