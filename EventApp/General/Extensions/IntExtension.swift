//
//  IntExtension.swift
//  EventApp
//
//  Created by betina farias on 06/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

extension Int {
    var stringFromUnixTimestamp: String {
        let timeInterval = Double(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateString = DateFormatter.brazillian2Digits.string(from: date)
        return dateString
    }
    
    var timeStringFromUnixTimestamp: String {
        let timeInterval = Double(self)
        let date = Date(timeIntervalSince1970: timeInterval)
        let timeString =  DateFormatter.timeString.string(from: date)
        return timeString
    }
}
