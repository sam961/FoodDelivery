//
//  CellIdentifiable.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 27/12/2021.
//

import UIKit

protocol CellIdentifiable {

    static var cellIdentifier: String { get }

    static var cellNibName: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: Self.self)
    }

    static var cellNibName: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        return UINib(nibName: cellNibName, bundle: nil)
    }
}

extension CellIdentifiable where Self: UICollectionViewCell {
    static var cellIdentifier: String {
        return String(describing: Self.self)
    }

    static var cellNibName: String {
        return String(describing: Self.self)
    }
}
