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
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.backgroundColor = .white
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.font(ofFamily: .ralewaySemibold, withSize: 18)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                 NSAttributedString.Key.font: UIFont.font(ofFamily: .ralewayBold, withSize: 26)]
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        
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
        let eventsCoordinator = EventsCoordinator(presenter: rootViewController)
        eventsCoordinator.start()
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
}
