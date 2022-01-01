//
//  FeedPresenterImplementation.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 25/12/2021.
//

import Foundation

protocol FeedPresenter: AnyObject {
    func interactor(incrementerdBadgeNumber:String)
    func reloadTable()
}


class FeedPresenterImplementation: FeedPresenter {
    
    
    
    weak var viewController: FeedPresenterOutput?
    
    func interactor(incrementerdBadgeNumber: String) {
        viewController?.presenter(showInrecementedBadgeNumber: incrementerdBadgeNumber)
    }
    
    func reloadTable() {
        viewController?.presenterReloadTableView()
    }
    
}
