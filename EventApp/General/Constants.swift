//
//  Constants.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

struct Constants {
    struct Xibs {
        struct SplashViewController {
            static let xib = "SplashViewController"
            static let title = "Eventos"
        }
        struct HomeViewController {
            static let xib = "HomeViewController"
            static let title = "Eventos"
        }
        struct EventDetailViewController {
            static let xib = "EventDetailViewController"
            static let title = "Detalhes"
        }
    }
}

struct APIConstants {
    static private let dictionaryInfo = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Info", ofType: "plist") ?? "")
    
    static private var dictionaryConfig: [String: Any]? {
        return dictionaryInfo?["Config"] as? [String: Any]
    }
    
    static var BaseURL: String {
        return dictionaryConfig?["urlBase"] as? String ?? ""
    }
    
    enum HTTPHeaderField: String {
        case contentType = "Content-Type"
        case acceptType = "Accept"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
