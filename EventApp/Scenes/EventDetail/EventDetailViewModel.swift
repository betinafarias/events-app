//
//  EventDetailViewModel.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

protocol EventDetailViewModelProtocol: AnyObject {
    var event: Dynamic<Event?> { get }
    func loadData()
}

final class EventDetailViewModel {
    var event: Dynamic<Event?> = Dynamic(nil)
    var tableCellHeight: Int = 164
   
    private var eventId: String
    
    init(eventId: String) {
        self.eventId = eventId
    }
}

extension EventDetailViewModel: EventDetailViewModelProtocol {
    func loadData() {
        APIManager.request(with: EventsEndpoint.getEvent(id: eventId)) { [weak self] (result: Result<Event, APIError>) in
            switch result {
            case .success(let event):
                DispatchQueue.main.async {
                    self?.event.value = event
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
