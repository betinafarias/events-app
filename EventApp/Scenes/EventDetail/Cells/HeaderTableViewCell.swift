//
//  HeaderTableViewCell.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit
import Kingfisher

class HeaderTableViewCell: NibRegistrableTableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateBackgroundView: UIView! {
        didSet {
            dateBackgroundView.backgroundColor = UIColor.secondaryColor
        }
    }
    @IBOutlet weak var eventDateLabel: UILabel! {
        didSet {
            eventDateLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 17)
            eventDateLabel.textColor = .white
        }
    }
    
    func configure(with event: Event) {
        guard let imageUrlString = event.image,
            let url = URL(string: imageUrlString) else { return }
        
        let resource = ImageResource(downloadURL: url, cacheKey: imageUrlString)
        self.eventImageView.kf.indicatorType = .activity
        self.eventImageView.kf.setImage(with: resource,
                                        placeholder: UIImage(named: "placeholder"),
                                        options: [.transition(.fade(1)),
                                                  .cacheOriginalImage])
        self.eventDateLabel.text = "\(event.dateString) às \(event.eventTime)h"
    }
}
