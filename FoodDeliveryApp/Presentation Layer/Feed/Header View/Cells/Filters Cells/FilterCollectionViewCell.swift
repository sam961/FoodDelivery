//
//  FilterCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 01/01/2022.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell,CellIdentifiable {

    @IBOutlet weak var filteredButton: UIButton!
    
    var filterButtonPressedClosure:(()->Void)?
    
    var filterName:String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.filteredButton.layer.borderColor = UIColor.systemGray6.cgColor
        self.filteredButton.layer.borderWidth = 1
        self.filteredButton.layer.shadowRadius = 1.0
        self.filteredButton.layer.shadowColor = UIColor.gray.cgColor
        self.filteredButton.setTitleColor(UIColor.systemGray4, for: .normal)
       
    }
    
    override func layoutSubviews() {
        
        self.filteredButton.layer.cornerRadius = self.filteredButton.frame.height/2
    }
    
    func populateData(){
        self.filteredButton.setTitle(filterName, for: .normal)
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        self.filterButtonPressedClosure?()
    }
    
}
