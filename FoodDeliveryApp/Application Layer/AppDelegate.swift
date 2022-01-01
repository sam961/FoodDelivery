//
//  AppDelegate.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 23/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let feedVC = FeedViewController.instantiateFrom(storyboard: .main)
        let navVC = UINavigationController(rootViewController: feedVC)
        FeedConfigurator.configureModule(viewController: feedVC)
        
        window = UIWindow()
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }


}

