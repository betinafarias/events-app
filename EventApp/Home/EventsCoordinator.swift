//
//  HomeCoordinator.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class EventsCoordinator {
    private let presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    
    func start() {
        let viewModel = HomeViewModel(navigationDelegate: self)
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.title = Constants.Xibs.HomeViewController.title
        self.presenter.pushViewController(viewController, animated: true)
    }
}

extension EventsCoordinator: HomeNavigationDelegate {
    func showDetail() {
        
    }
}
