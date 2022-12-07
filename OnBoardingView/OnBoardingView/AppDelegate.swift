//
//  AppDelegate.swift
//  OnBoardingView
//
//  Created by Krupanshu Sharma on 06/12/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = OnBoardingViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRootViewController() {
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
    }

}

