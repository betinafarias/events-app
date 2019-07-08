//
//  HomeViewModel.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

protocol HomeNavigationDelegate: AnyObject {
    func showDetail(with eventId: String)
}

protocol HomeViewModelProtocol: AnyObject {
    var events: Dynamic<[Event]> { get }
    var tableCellHeight: Int { get }
    func showDetail(with eventId: String)
    func loadData()
}

final class HomeViewModel {
    private var navigationDelegate: HomeNavigationDelegate?
    var events: Dynamic<[Event]> = Dynamic([])
    var tableCellHeight: Int = 164
    
    init(navigationDelegate: HomeNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func showDetail(with eventId: String) {
        self.navigationDelegate?.showDetail(with: eventId)
    }
    
    func loadData() {
        APIManager.request(with: EventsEndpoint.getEvents) { [weak self] (result: Result<[Event], APIError>) in
            switch result {
            case .success(let events):
                DispatchQueue.main.async {
                    self?.events.value = events
                }
            case .failure(let error):
                // TODO: treat errors
                print(error.localizedDescription)
            }
        }
    }
}
