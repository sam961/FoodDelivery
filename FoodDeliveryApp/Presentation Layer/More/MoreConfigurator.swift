//
//  MoreConfigurator.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 26/12/2021.
//

import Foundation

class MoreConfigurator{
    
    static func configureModule(viewController: MoreViewController) {
        
        let router = MoreRouterImplementation()
        let interactor = MoreInteractorImplementation()
        let presenter = MorePresenterImplementation()
        
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
