//
//  MorePresenterImplementation.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 26/12/2021.
//

import Foundation

protocol MorePresenter:AnyObject { }

class MorePresenterImplementation: MorePresenter {
    
    weak var viewController: MorePresenterOutput?
}
