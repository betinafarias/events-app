//
//  AppCoordinator.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    private var rootViewController: UINavigationController {
        return navigationController
    }
    
    private lazy var splashViewController: SplashViewController = {
        let viewModel = SplashViewModel(navigationDelegate: self)
        let splashViewController = SplashViewController(viewModel: viewModel)
        return splashViewController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = splashViewController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: SplashNavigationDelegate {
    func showHome() {
        let eventsCoordinator = HomeCoordinator(presenter: rootViewController)
        eventsCoordinator.start()
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
}
