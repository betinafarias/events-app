//
//  Util.swift
//  EventApp
//
//  Created by betina farias on 06/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import Foundation

struct Util {
    static func className(for _class: AnyClass) -> String {
        let str = String(describing: type(of: _class))
        guard str.hasSuffix(".Type") else {
            return str
        }
        return String(str[..<str.index(str.endIndex, offsetBy: -5)])
    }

    static func converTimeIntervalSince1970ToString(_ time: Int) -> String {
        let timeInterval = Double(time)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateString = DateFormatter.brazillian2Digits.string(from: date)
        return dateString
    }
}


