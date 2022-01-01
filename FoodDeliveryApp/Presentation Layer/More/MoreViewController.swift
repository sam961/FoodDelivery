//
//  MoreViewController.swift
//  FoodDeliveryApp
//
//  Created by Sam Kadri on 26/12/2021.
//

import UIKit

protocol MorePresenterOutput: AnyObject { }

class MoreViewController: BaseViewController {

    @IBOutlet weak var moreTableView: UITableView!
    
    var interactor: MoreInteractor?
    var router: MoreRouter?
    
    lazy var tableViewHeaderheight:CGFloat={
        return self.moreTableView.tableHeaderView?.frame.height ?? 0
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        interactor?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        
        if let headerView = self.moreTableView.tableHeaderView {

            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame

            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = 125
                headerView.frame = headerFrame
                self.moreTableView.tableHeaderView = headerView
            }
        }
    }
}

// MARK: Private Helper Methods
private extension MoreViewController {
    func setupUI(){
        
        navigationController?.isNavigationBarHidden = true
        setupTableView()
    }
    
    func setupTableView() {
        let yourTableViewHeader = (Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as? UIView)

        moreTableView.tableHeaderView = yourTableViewHeader
        moreTableView.separatorStyle = .none
        moreTableView.tableFooterView = UIView.init(frame: .zero)
        moreTableView.contentInsetAdjustmentBehavior = .never
        
        let cellNib = UINib(nibName: ItemTableViewCell.cellNibName, bundle: nil)
        moreTableView.register(cellNib, forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
    }



}

// MARK: MorePresenterOutput
extension MoreViewController: MorePresenterOutput { }

// MARK: UITableViewDataSource
extension MoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath)
        return cell
    }
}

// MARK: UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router?.routerToDetail()
    }
}
