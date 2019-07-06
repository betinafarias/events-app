//
//  NibRegistrableView.swift
//  EventApp
//
//  Created by betina farias on 06/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

public protocol NibRegistrableView: class {
    static var nibName: String { get }
    static var reuseId: String { get }
}

public extension NibRegistrableView {
    static var nibName: String { return Util.className(for: self) }
    static var reuseId: String { return Util.className(for: self) }
    static var nib: UINib { return UINib(nibName: nibName, bundle: Bundle(for: self)) }
    static func instantiateFromNib() -> Self? {
        return self.nib.instantiate(withOwner: nil, options: nil).first as? Self
    }
}

public typealias NibRegistrableTableViewCell = NibRegistrableView & UITableViewCell

public extension UITableView {
    func registerNib(for cellClass: NibRegistrableTableViewCell.Type) {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.reuseId)
    }
    
    func dequeueReusableCell<T: NibRegistrableTableViewCell>() -> T? {
        return dequeueReusableCell(withIdentifier: T.reuseId) as? T
    }
}
