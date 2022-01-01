//
//  MoreInteractorImplementation.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 26/12/2021.
//

import Foundation

protocol MoreInteractor:AnyObject{
    func viewDidLoad()
}

final class MoreInteractorImplementation: MoreInteractor {
    
    var presenter:MorePresenter?
    
    func viewDidLoad() { }
}
