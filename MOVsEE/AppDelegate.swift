//
//  AppDelegate.swift
//  MOVsEE
//
//  Created by Joe Lucero on 8/4/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MovieController.grabAllMoviesWith(usersSearchTerm: "Fargo") { (movies) in
            print(movies)
        }
        
        return true
    }

}
