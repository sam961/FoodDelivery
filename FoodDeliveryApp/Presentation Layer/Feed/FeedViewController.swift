//
//  FeedViewController.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 25/12/2021.
//

import UIKit

protocol FeedPresenterOutput: AnyObject {
    func presenter(showInrecementedBadgeNumber:String)
    func presenterReloadTableView()
}

final class FeedViewController: BaseViewController {

    //MARK: IBOutlets
    @IBOutlet private weak var feedTableView: UITableView!
    
    var headerView: HeaderView?
    
    let badgeButton = BadgeButton()
    
    var interactor: FeedInteractor?
    var router: FeedRouter?
    
   
    lazy var tableViewHeaderheight: CGFloat = {
        return self.feedTableView.tableHeaderView?.frame.height ?? 0
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupCartButton()
        interactor?.viewDidLoad()
  
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = self.feedTableView.tableHeaderView {

            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame

            // Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = UIScreen.main.bounds.size.height*0.8
                headerView.frame = headerFrame
                self.feedTableView.tableHeaderView = headerView
            }
        }
    }
}

// MARK: Private Helper Methods
private extension FeedViewController {
    func setupUI(){
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.delegate = self
        setUpTableView()
    }
    
    func setUpTableView() {
        
        feedTableView.tableHeaderView = headerView
        feedTableView.separatorStyle = .none
        feedTableView.tableFooterView = UIView.init(frame: .zero)
        feedTableView.contentInsetAdjustmentBehavior = .never
        
        let cellNib = UINib(nibName: ItemTableViewCell.cellNibName, bundle: nil)
        feedTableView.register(cellNib, forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
    }
    
    private func setupCartButton(){
        badgeButton.frame = CGRect(x: view.frame.width - 88, y: view.frame.height - 88, width: 44, height: 44)
        badgeButton.setImage(UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        badgeButton.badgeEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10)
        view.addSubview(badgeButton)
    }
    

}

// MARK: FeedPresenterOutput
extension FeedViewController: FeedPresenterOutput {
    func presenterReloadTableView() {
        self.feedTableView.reloadData()
    }

    func presenter(showInrecementedBadgeNumber: String) {
        
        self.badgeButton.badge = showInrecementedBadgeNumber
    }
}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath) as! ItemTableViewCell
        let item = self.interactor?.itemAtIndex(index: indexPath.row)
        cell.configure(with: item!)
        cell.didClickOnAddToCartClosure = { [weak self] in
            
            guard let self = self else {return}
            
            self.interactor?.incrementBadge(currentBadge: self.badgeButton.badge)
            

        }
        return cell
    }
}

// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routerToDetail()
    }
}



extension FeedViewController:UINavigationControllerDelegate,UIGestureRecognizerDelegate{
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let enable = self.navigationController?.viewControllers.count ?? 0 > 1
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = enable
    }
}
