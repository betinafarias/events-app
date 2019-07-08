//
//  EventsEndpoint.swift
//  EventApp
//
//  Created by betina farias on 05/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

enum EventsEndpoint: APIRoute {
    var method: RequestMethod { return .GET }
    
    case getEvents
    case getEvent(id: String)
    
    var path: String {
        switch self {
        case .getEvents:
            return "/events"
        case .getEvent(let id):
            return "/events/\(id)"
        }
    }
    
    var parameters: RequestParameters? { return nil }
}
