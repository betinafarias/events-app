//
//  HomeViewController.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.backgroundColor = .clear
            tableView.tableFooterView = UIView()
        }
    }
    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: Constants.Xibs.HomeViewController.xib, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) for \(Constants.Xibs.SplashViewController.xib) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
    }
    
    private func configBind() {
//        viewModel.events.bind { [weak self] events in
//            let dataSource = TableViewDataSource(
//                models: events,
//                reuseIdentifier: "message"
//            ) { message, cell in
//                cell.textLabel?.text = message.title
//                cell.detailTextLabel?.text = message.preview
//            }
//            self?.tableView.dataSource =
//        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
