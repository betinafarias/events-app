//
//  PriceTableViewCell.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

protocol PriceTableViewCellDelegate: AnyObject {
    func didTapCheckin()
}

class PriceTableViewCell: NibRegistrableTableViewCell {
    @IBOutlet weak var discountLabel: UILabel! {
        didSet {
            discountLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 50)
            discountLabel.textColor = .white
            
        }
    }
    @IBOutlet weak var discountTitleLabel: UILabel! {
        didSet {
            discountTitleLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 18)
            discountTitleLabel.textColor = .white
            // TODO: Localize strings
            discountTitleLabel.text = "Cupom de desconto"
        }
    }
    
    @IBOutlet weak var priceTitleLabel: UILabel! {
        didSet {
            priceTitleLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 16)
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.font(ofFamily: .ralewayRegular, withSize: 40)
        }
    }
    
    @IBOutlet weak var checkinButton: UIButton! {
        didSet {
            checkinButton.titleLabel?.font = UIFont.font(ofFamily: .ralewayBold, withSize: 16)
            checkinButton.setTitleColor(.white, for: .normal)
            checkinButton.backgroundColor = .primaryColor
            checkinButton.layer.cornerRadius = 22
            // TODO: Localize strings
            checkinButton.setTitle("Check in", for: .normal)
        }
    }
    
    weak var delegate: PriceTableViewCellDelegate?
    
    func configure(with event: Event) {
        priceLabel.text = event.price.currencyFormatter
        guard let discount = event.cupons?.first?.discount else { return }
        discountLabel.text = "\(discount)%"
    }
    
    @IBAction func checkinTapped(_ sender: Any) {
        delegate?.didTapCheckin()
    }
}
