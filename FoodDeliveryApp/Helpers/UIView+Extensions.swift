//
//  UIView+Extensions.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 23/12/2021.
//

import UIKit

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    class func fromNib(named: String? = nil) -> Self {
         let name = named ?? "\(Self.self)"
         guard
             let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
             else { fatalError("missing expected nib named: \(name)") }
         guard
             /// we're using `first` here because compact map chokes compiler on
             /// optimized release, so you can't use two views in one nib if you wanted to
             /// and are now looking at this
             let view = nib.first as? Self
             else { fatalError("view of type \(Self.self) not found in \(nib)") }
         return view
     }
}
