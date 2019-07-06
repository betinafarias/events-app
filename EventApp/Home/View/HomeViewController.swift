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
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
            tableView.tableFooterView = UIView()
            tableView.registerNib(for: EventListTableViewCell.self)
            tableView.allowsSelection = false
        }
    }
    private let viewModel: HomeViewModelProtocol
    private var dataSource: UITableViewDataSource?
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: Constants.Xibs.HomeViewController.xib, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) for \(Constants.Xibs.SplashViewController.xib) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBind()
        viewModel.loadData()
    }
    
    private func configBind() {
        viewModel.events.bind { [weak self] events in
            let dataSource = TableViewDataSource(
                models: events,
                reuseIdentifier: "EventListTableViewCell"
            ) { event, cell in
                if let eventCell = cell as? EventListTableViewCell {
                    eventCell.eventNameLabel.text = event.title
                    eventCell.eventDescriptionLabel.text = event.description
                }
            }
            self?.dataSource = dataSource
            self?.tableView.dataSource = dataSource
            self?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: viewModel.tableCellHeight)
    }
}
