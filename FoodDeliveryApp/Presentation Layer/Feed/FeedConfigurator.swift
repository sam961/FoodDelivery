//
//  FeedConfigurator.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 25/12/2021.
//

import Foundation

class FeedConfigurator {
    
    static func configureModule(viewController: FeedViewController) {
        
        let headerView = HeaderView.fromNib()
        let router = FeedRouterImplementation()
        let interactor = FeedInteractorImplementation()
        let presenter = FeedPresenterImplementation()
        
        viewController.headerView = headerView
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
