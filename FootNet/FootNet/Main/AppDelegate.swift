//
//  AppDelegate.swift
//  FootNet
//
//  Created by Anan Sadiya on 26/02/2019.
//  Copyright © 2019 FootNet. All rights reserved.
//

import UIKit
import CocoaLumberjack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //Logger
    public let fileLogger: DDFileLogger = DDFileLogger()
    private func setupLogger() {
        DDLog.add(DDTTYLogger.sharedInstance)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupLogger()
        DDLogInfo("App starts, let's have some fun!")
        return true
    }
    
}

