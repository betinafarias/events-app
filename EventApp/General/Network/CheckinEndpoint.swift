//
//  CheckinEndpoint.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

enum CheckinEndpoint: APIRoute {
    var method: RequestMethod { return .POST }
    
    case checkin(name: String, email: String, eventId: String)
    
    var path: String {
        switch self {
        case .checkin:
            return "/checkin"
        }
    }
    
    var parameters: RequestParameters? {
        if case let CheckinEndpoint.checkin(name, email, eventId) = self {
            let parameters: RequestParameters = [
                "eventId": eventId,
                "name": name,
                "email": email
            ]
            return parameters
        }
        return nil
    }
}
