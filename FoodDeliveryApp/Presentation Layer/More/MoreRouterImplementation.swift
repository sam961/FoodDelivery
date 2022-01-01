//
//  MoreRouterImplementation.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 26/12/2021.
//

import UIKit

protocol MoreRouter: AnyObject {
    var navigationController: UINavigationController?{get}
    func routerToDetail()
}

class MoreRouterImplementation: MoreRouter {
    
    var navigationController: UINavigationController?
    
    func routerToDetail() { }
}
