//
//  UIFontExtension.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

enum FontFamily: String {
    case ralewaySemibold = "Raleway-SemiBold"
    case ralewayMedium = "Raleway-Medium"
    case ralewayRegular = "Raleway-Regular"
    case ralewayBold = "Raleway-Bold"
    case ralewayLight = "Raleway-Light"
}

extension UIFont {
    static func font(ofFamily family: FontFamily, withSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: family.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
