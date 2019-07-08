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
    private var homeViewController: HomeViewController?
    private var eventDetailViewController: EventDetailViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = HomeViewModel(navigationDelegate: self)
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.title = Constants.Xibs.HomeViewController.title
        presenter.pushViewController(viewController, animated: true)
        homeViewController = viewController
    }
}

extension EventsCoordinator: HomeNavigationDelegate {
    func showDetail(with eventId: String) {
        let viewModel = EventDetailViewModel(eventId: eventId)
        let viewController = EventDetailViewController(viewModel: viewModel)
        viewController.title = Constants.Xibs.EventDetailViewController.title
        presenter.pushViewController(viewController, animated: true)
        eventDetailViewController = viewController
    }
}
