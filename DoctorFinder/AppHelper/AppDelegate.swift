//
//  AppDelegate.swift
//  DoctorFinder
//
//  Created by Vishnu Sharma on 04/07/18.
//  Copyright © 2018 Vishnu Sharma. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    class func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        configAppDelegate(application)
        let navigationBarcolor = UIColor(red: 216.0/255, green: 68.0/255, blue: 44.0/255, alpha: 1.0)
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = navigationBarcolor
        
        if isLogin()
        {
            let viewControllerObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as? SWRevealViewController
            let rootNavigationController = application.windows[0].rootViewController as! UINavigationController
            rootNavigationController.pushViewController(viewControllerObj!, animated: true)
        }
        else
        {
            let viewControllerObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
            let rootNavigationController = application.windows[0].rootViewController as! UINavigationController
            rootNavigationController.pushViewController(viewControllerObj!, animated: true)
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
    
    //Configure AppDelegate
    func configAppDelegate(_ application: UIApplication) {
        //set status bar bgcolor
        setStatusBarBackgroundColor(color: UIColor(red: 216.0/255, green: 68.0/255, blue: 44.0/255, alpha: 1.0))
        setViewController()
        
        //Configure firebase
        
        
        //set keyboard dependent scrolling
        
    }
    
    //Set RootViewController
    func setViewController() {
        
    }
    
    //Status bar customize
    func setStatusBarBackgroundColor(color: UIColor)
    {
        guard  let statusBar = (UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject).value(forKey: "statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    
    
}

