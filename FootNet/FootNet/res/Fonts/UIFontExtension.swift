//
//  UIFontsExtension.swift
//  FootNet
//
//  Created by Anan Sadiya on 27/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static var fontSystemS26 : UIFont {
        //get { return UIFont(name: ".SFUIText-Medium", size: 26)! }
        get { return UIFont.systemFont(ofSize: 26) }
    }
    
    static var fontSystemS20 : UIFont {
        //get { return UIFont(name: ".SFUIText-Medium", size: 20)! }
        get { return UIFont.systemFont(ofSize: 20) }
    }
    
    static var fontSystemS13 : UIFont {
        //get { return UIFont(name: ".SFUIText-Medium", size: 13)! }
        get { return UIFont.systemFont(ofSize: 13) }
    }
}
