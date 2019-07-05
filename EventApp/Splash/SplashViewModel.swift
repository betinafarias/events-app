//
//  SplashViewModel.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

protocol SplashNavigationDelegate: AnyObject {
    func showHome()
}

protocol SplashViewModelProtocol: AnyObject {
    func navigate()
}

final class SplashViewModel {
    private weak var navigationDelegate: SplashNavigationDelegate?
    
    init(navigationDelegate: SplashNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    func navigate() {
        self.navigationDelegate?.showHome()
    }
}
