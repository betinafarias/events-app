//
//  Event.swift
//  EventApp
//
//  Created by betina farias on 05/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let id: String
    let title: String
    let price: Double
//    let latitude: AnyObject
////    let longitude: String
    let image: String?
    let description: String
    let date: Int
    let people: [Person]
    let cupons: [Coupon]?
    
//    enum CodingKeys: String, CodingKey {
//        case latitude
//    }
    
//    init(from decoder: Decoder) throws {
//        do {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            if let stringProperty = try? container.decode(String.self, forKey: .latitude) {
//                latitude = (stringProperty as NSString).doubleValue
//            } else if let intProperty = try? container.decode(Double.self, forKey: .latitude) {
//                latitude = intProperty
//            } else {
//                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
//            }
//            id = try? container.decode(String., forKey: <#T##Event.CodingKeys#>)
//        }
//
//
//    }
}

struct Person: Decodable {
    let id: String
    let eventId: String
    let name: String
    let picture: String
}

struct Coupon: Decodable {
    let id: String
    let eventId: String
    let discount: Int
}
