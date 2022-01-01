//
//  API.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 29/12/2021.
//

import Foundation

protocol Api {
    func fetchItems(completion: @escaping (Bool, [MenuItem]?) -> Void)
}

final class ApiClient: Api {
    func fetchItems(completion: @escaping (Bool, [MenuItem]?) -> Void) {
        // reach the actual API
    }
}

final class MockApiClient: Api {
    
    private static let delay = 1
    
    func fetchItems(completion: @escaping (Bool, [MenuItem]?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(MockApiClient.delay)) {
            let filename = "Items"
            if let items = MockApiClient.loadJsonDataFromFile(filename: filename) {
                completion(true, items)
            } else {
                fatalError("Couldn't load data from \(filename)")
            }
        }
        
    }
    
    static func loadJsonDataFromFile(filename fileName: String) -> [MenuItem]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([MenuItem].self, from: data)
                return jsonData
            } catch {
                fatalError("Couldn't load data from \(fileName)")
            }
            
        }
        
        return nil
    }
}

