//
//  PersonCollectionViewCell.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit
import Kingfisher

class PersonCollectionViewCell: NibRegistrableCollectionViewCell {

    @IBOutlet weak var thumbImageView: UIImageView! {
        didSet {
            thumbImageView.layer.cornerRadius = 35
            thumbImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.font(ofFamily: .ralewaySemibold, withSize: 14)
        }
    }
    
    func configure(with person: Person) {
        nameLabel.text = person.name
        
        guard let url = URL(string: person.picture) else { return }
        
        let resource = ImageResource(downloadURL: url, cacheKey: person.picture)
        
        self.thumbImageView.kf.indicatorType = .activity
        self.thumbImageView.kf.setImage(with: resource,
                                        placeholder: UIImage(named: "placeholder"),
                                        options: [.transition(.fade(1)),
                                                  .cacheOriginalImage])
    }
}
