//
//  EventDescriptionTableViewCell.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class EventDescriptionTableViewCell: NibRegistrableTableViewCell {
    @IBOutlet weak var eventTitleLabel: UILabel! {
        didSet {
            eventTitleLabel.text = ""
            eventTitleLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 24)
        }
    }
    @IBOutlet weak var eventDescriptionLabel: UILabel! {
        didSet {
            eventDescriptionLabel.text = ""
            eventDescriptionLabel.font = UIFont.font(ofFamily: .ralewayRegular, withSize: 16)
        }
    }
    
    func configure(with model: Event) {
        eventTitleLabel.text = model.title
        eventDescriptionLabel.text = model.description
    }
}
