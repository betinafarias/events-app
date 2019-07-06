//
//  EventListTableViewCell.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class EventListTableViewCell: NibRegistrableTableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView! {
        didSet {
            thumbImageView.layer.cornerRadius = 8
            thumbImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.cornerRadius = 4
            cardView.clipsToBounds = true
            cardView.backgroundColor = .white
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor.tableCellBorder.cgColor
            cardView.layer.shadowColor = UIColor.tableCellShadow.cgColor
            cardView.layer.shadowOpacity = 1
            cardView.layer.shadowOffset = .zero
            cardView.layer.shadowRadius = 10
        }
    }
    @IBOutlet weak var eventNameLabel: UILabel! {
        didSet {
            eventNameLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 18)
        }
    }
    @IBOutlet weak var eventDescriptionLabel: UILabel! {
        didSet {
            eventDescriptionLabel.font = UIFont.font(ofFamily: .ralewayRegular, withSize: 12)
            eventDescriptionLabel.textColor = UIColor.grayText
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.font(ofFamily: .ralewayRegular, withSize: 18)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
}
