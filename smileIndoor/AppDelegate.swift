//
//  AppDelegate.swift
//  smileIndoor
//
//  Created by Jean-Baptiste Bonhomme on 19/08/18.
//  Copyright © 2018 jbInc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let locBld = EILLocationBuilder()
        locBld.setLocationName("testSalon")
        
        locBld.setLocationBoundaryPoints([
            EILPoint(x:0.00, y:0.00),
            EILPoint(x:0.00,y:4.20),
            EILPoint(x:4.00,y:4.20),
            EILPoint(x:4.00,y:0.00),
            ])
        
        locBld.addBeacon(withIdentifier: "0ec9f31f4fc774c8926a6722cab3a618", atBoundarySegmentIndex: 0, inDistance: 4.20, from: .leftSide)
        locBld.addBeacon(withIdentifier: "7506f83b84b2a83ef101832833dfb521", atBoundarySegmentIndex: 1, inDistance: 4.00, from: .leftSide)
        locBld.addBeacon(withIdentifier: "6a3c137d6c5980b599e7e12cacb3a61e", atBoundarySegmentIndex: 2, inDistance: 4.20, from: .leftSide)
        locBld.addBeacon(withIdentifier: "9d75683d1b5fd14c918bd7d5b74b5909", atBoundarySegmentIndex: 3, inDistance: 4.00, from: .leftSide)
        
        locBld.setLocationOrientation(291)
        
            if let loc = locBld.build() {
                ESTConfig.setupAppID("appId", andAppToken: "appToken")
                let addLocRq = EILRequestAddLocation(location: loc)
                addLocRq.sendRequest { (loc, err) in
                    if err != nil {
                        NSLog("Error, location was not saved: \(String(describing: err))")
                    } else {
                        NSLog("Success, location correctly saved: \(String(describing: loc?.identifier))")
                    }
                }
            } else {
                NSLog("null")
            }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

