//  AppDelegate.swift
//  Decor
//  Created by iOS-Appentus on 04/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        return true
    }

    
}

