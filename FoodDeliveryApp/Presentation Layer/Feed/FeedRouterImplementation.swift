//
//  FeedRouterImplementation.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 25/12/2021.
//

import UIKit

protocol FeedRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    func routerToDetail()
}

class FeedRouterImplementation: FeedRouter {
  
    var navigationController: UINavigationController?
    
    func routerToDetail() {
        let moreViewController = MoreViewController.instantiateFrom(storyboard: .main)
        MoreConfigurator.configureModule(viewController: moreViewController)
        navigationController?.pushViewController(moreViewController, animated: true)
    }
}
