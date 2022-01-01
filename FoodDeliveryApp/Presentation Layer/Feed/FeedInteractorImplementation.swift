//
//  FeedSceneInteractor.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 25/12/2021.
//

import Foundation

protocol FeedInteractor: AnyObject {
    func viewDidLoad()
    func incrementBadge(currentBadge:String?)
    func fetchHomeFeeds()
    var numberOfRows:Int{get}
    func itemAtIndex(index:Int)->MenuItem
}

final class FeedInteractorImplementation: FeedInteractor {

    var presenter: FeedPresenter?
    
    private var list = [MenuItem]()
    
    func viewDidLoad() {
        
        self.fetchHomeFeeds()
    }
    
    func incrementBadge(currentBadge:String?){
        
        let currentBadgeIntValue:Int!
        
        if let currentBadge  = currentBadge {
             currentBadgeIntValue = Int(currentBadge)!
        }else{
             currentBadgeIntValue = 0
        }
        let nextValue = String(currentBadgeIntValue + 1)
    
        presenter?.interactor(incrementerdBadgeNumber: nextValue)
        
    }
    
    var numberOfRows: Int {
        return self.list.count
    }
    
    func itemAtIndex(index: Int)->MenuItem{
        return self.list[index]
    }

    func fetchHomeFeeds() {
        let apiService: Api = { return MockApiClient() }()
        
        apiService.fetchItems { success, items in
            if success, let items = items {
                self.list = items
                    self.presenter?.reloadTable()

            }
        }
    }
}
