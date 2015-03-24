//
//  AppDelegate.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 2/26/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
    
//        Parse.setApplicationId("bcVknfGq1bDA7N49lStTu8D1GYh2KuhQp7GS3L8s", clientKey: "DvLRccnvpcCb44si4B66bWETsNC1oTruONDWtAzs")
        
        
        Parse.setApplicationId("bcVknfGq1bDA7N49lStTu8D1GYh2KuhQp7GS3L8s",
            clientKey:"DvLRccnvpcCb44si4B66bWETsNC1oTruONDWtAzs")
        
        
        // Register for Push Notitications
        
        let userNotificationType = (UIUserNotificationType.Alert |
            UIUserNotificationType.Badge |
            UIUserNotificationType.Sound)
        
        let settings = UIUserNotificationSettings(forTypes: userNotificationType, categories: nil)
        
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
//        
//        var mainSB = UIStoryboard(name: "Main", bundle: nil)
//        
//        var loginVC = mainSB.instantiateInitialViewController() as LoginVC
//        
//        window?.rootViewController = loginVC
//        
        
        return true
    
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        let currentInstallation = PFInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken)
        currentInstallation.saveInBackgroundWithBlock(nil)
        
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        // PFPush.handlePush(userInfo)
        
        NSNotificationCenter.defaultCenter().postNotificationName("Push Touch", object: nil, userInfo: userInfo)
        
        println(userInfo)
        
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

