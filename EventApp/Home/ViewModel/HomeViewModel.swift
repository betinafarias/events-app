//
//  HomeViewModel.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

protocol HomeNavigationDelegate: AnyObject {
    func showDetail()
}

protocol HomeViewModelProtocol: AnyObject {
    func showDetail()
}

final class HomeViewModel {
    private weak var navigationDelegate: HomeNavigationDelegate?
    
    init(navigationDelegate: HomeNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func showDetail() {
        self.navigationDelegate?.showDetail()
    }
}
