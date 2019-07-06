//
//  NibInstantiatable.swift
//  EventApp
//
//  Created by betina farias on 06/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

public protocol NibInstantiatable {
    static func instantiateFromNib(bundle: Bundle?) -> Self?
}

public extension NibInstantiatable where Self: UIView {
    static func instantiateFromNib(bundle: Bundle?) -> Self? {
        let nibName = Util.className(for: Self.self)
        let arrayViews =  UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: nil, options: nil)
        return arrayViews.first as? Self
    }
}
