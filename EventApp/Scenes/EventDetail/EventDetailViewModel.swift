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
    var delegate: EventViewModelDelegate? { get set }
    func loadData()
    func checkin(name: String, email: String)
}

protocol EventViewModelDelegate: AnyObject {
    func showCheckinSucceededAlert()
}

final class EventDetailViewModel {
    var event: Dynamic<Event?> = Dynamic(nil)
    private var eventId: String
    internal var delegate: EventViewModelDelegate?
    
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
                // TODO: treat errors
                print(error.localizedDescription)
            }
        }
    }
    
    func checkin(name: String, email: String) {
        APIManager.request(with: CheckinEndpoint.checkin(name: name, email: email, eventId: eventId)) { [weak self] (result: Result<Bool, APIError>) in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.delegate?.showCheckinSucceededAlert()
                }
            case .failure(let error):
                // TODO: treat errors
                print(error.localizedDescription)
            }
        }
    }
}
