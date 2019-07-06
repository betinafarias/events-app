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
    var events: Dynamic<[Event]> { get }
    
    func showDetail()
    func loadData()
}

final class HomeViewModel {
    private weak var navigationDelegate: HomeNavigationDelegate?
    var events: Dynamic<[Event]> = Dynamic([])
    
    init(navigationDelegate: HomeNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func loadData() {
        APIManager.request(with: EventsEndpoint.getEvents) { [weak self] (result: Result<[Event], APIError>) in
            switch result {
            case .success(let events):
                DispatchQueue.main.async {
                    self?.events.value = events
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func showDetail() {
        self.navigationDelegate?.showDetail()
    }
}
