//
//  ItemTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 23/12/2021.
//

import UIKit


class ItemTableViewCell: UITableViewCell, CellIdentifiable {

    @IBOutlet private weak var holderView: UIView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    @IBOutlet private weak var itemPriceLabel: UIButton!
    
    var didAddBottomSpace = false
    
    var didClickOnAddToCartClosure:(()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        holderView.layer.cornerRadius = 15
        holderView.layer.masksToBounds = true
        
        contentView.layer.backgroundColor = UIColor.clear.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4.0
    }

    override func layoutSubviews() {
        
        if !didAddBottomSpace {
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
            didAddBottomSpace = true
        }  
    }

    func configure(with menuItem: MenuItem) {
        itemNameLabel.text = menuItem.name
        itemDescriptionLabel.text = menuItem.description
        itemPriceLabel.setTitle("\(menuItem.price) usd", for: .normal)
    }

    @IBAction func addToCartButtonPressed(_ sender: UIButton) {
        
        guard let price = sender.titleLabel?.text else {
            return
        }
   
        self.didClickOnAddToCartClosure?()
        
        UIView.animate(withDuration: 1,delay: 0,options: [.transitionCrossDissolve]) {
            sender.layer.backgroundColor = UIColor.green.cgColor
            sender.alpha = 1.0
            sender.setTitle("added +1", for: .normal)
            
        } completion: { isFinished in
            
            if isFinished {
                UIView.animate(withDuration: 1.5,delay: 0,options: [.transitionCrossDissolve]) {
                    sender.backgroundColor = .black
                    sender.setTitle(price, for: .normal)
                }
            }
        }
    }
    
 
}
