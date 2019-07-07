//
//  IntExtension.swift
//  EventApp
//
//  Created by betina farias on 06/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let brazillian2Digits: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    static let timeString: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = NSLocale.current
        return formatter
    }()
}
