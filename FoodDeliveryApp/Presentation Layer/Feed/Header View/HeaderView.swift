//
//  HeaderView.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 22/12/2021.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var categoryHolderView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    var selectedCategoryIndex: Int = 0
    var selectedFilterIndexx: [Int] = []
    
    
    var imgArr = [  UIImage(named:"sale-1"),
                    UIImage(named:"sample-1"),
                    UIImage(named:"sale-1"),
                    UIImage(named:"sample-1"),
                    UIImage(named:"sale-1"),
                    UIImage(named:"sample-1"),
                    UIImage(named:"sale-1"),
                    UIImage(named:"sample-1")
    ]

    override func awakeFromNib() {
        commonInit()
    }

   private func commonInit() {
       initCollectionView()
       setupSlider()
   }
       
   private func initCollectionView() {
       
       categoryHolderView.clipsToBounds = true
       categoryHolderView.layer.cornerRadius = 25
       categoryHolderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       
       let nib = UINib(nibName: CategoryCollectionViewCell.cellNibName, bundle: nil)
       categoryCollectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier)
       
       let filterNib = UINib(nibName: FilterCollectionViewCell.cellNibName, bundle: nil)
       filterCollectionView.register(filterNib, forCellWithReuseIdentifier: FilterCollectionViewCell.cellIdentifier)
   }
    
    private func setupSlider() {

        let cellNib = UINib(nibName: SliderCollectionViewCell.cellNibName, bundle: nil)
        sliderCollectionView.register(cellNib, forCellWithReuseIdentifier: SliderCollectionViewCell.cellIdentifier)
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
    }
    
    func populateSliderCell(indexPath:IndexPath)->SliderCollectionViewCell{
        let cell = self.sliderCollectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.cellIdentifier, for: indexPath) as! SliderCollectionViewCell
        cell.sliderImageView.image = imgArr[indexPath.row]
        return cell
    }
    
    func populateCategoryCell(indexPath:IndexPath)->CategoryCollectionViewCell{
        let cell = self.categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        
        let label = cell.viewWithTag(1) as! UILabel
        label.text = "Pizza"

        if indexPath.item == selectedCategoryIndex {
            label.textColor = UIColor.black
        }else{
            label.textColor = UIColor.systemGray5
        }
        
        return cell
    
    }
    
    func populateFilterCell(indexPath:IndexPath)->FilterCollectionViewCell{
        let cell = self.filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.cellIdentifier, for: indexPath) as! FilterCollectionViewCell
        
        let button = cell.viewWithTag(1) as! UIButton
        button.setTitle("filter1", for: .normal)
        
        cell.filterButtonPressedClosure = {
            self.selectedFilterIndexx.append(indexPath.item)
            self.filterCollectionView.reloadData()
        }

        if selectedFilterIndexx.contains(indexPath.item) {
            button.backgroundColor = UIColor.black
        }else{
            button.backgroundColor = UIColor.white
        }
        
        return cell
    
    }
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return imgArr.count
        }

        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sliderCollectionView {
            return populateSliderCell(indexPath: indexPath)
        }
        
        if collectionView == categoryCollectionView {
            return populateCategoryCell(indexPath: indexPath)
        }
        
        if collectionView == filterCollectionView {
            return populateFilterCell(indexPath: indexPath)
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        selectedCategoryIndex = indexPath.item
        collectionView.reloadData()
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == sliderCollectionView {
            let size = sliderCollectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        }
        
        if collectionView == filterCollectionView {
            let size = filterCollectionView.frame.size
            return CGSize(width: 70, height: size.height)
        }
        
        return CGSize(width: "Pizza".size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 34)]).width + 25, height: collectionView.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let cell = sliderCollectionView.visibleCells.first, let indexPath = sliderCollectionView.indexPath(for: cell) {
            pageView.currentPage = indexPath.item
        }
    }
}
