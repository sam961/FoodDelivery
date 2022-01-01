//
//  Storyboarded.swift
//  Twa
//
//  Created by Sam Kadri on 03/05/2021.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
}

protocol Storyboarded {
    static func instantiateFrom(storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiateFrom(storyboard: Storyboard) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: id) as! Self
        return viewController
    }
}

