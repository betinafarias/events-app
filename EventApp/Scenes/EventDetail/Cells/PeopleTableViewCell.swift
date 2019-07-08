//
//  PeopleTableViewCell.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class PeopleTableViewCell: NibRegistrableTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var peopleLabelBackgroundView: UIView! {
        didSet {
            peopleLabelBackgroundView.backgroundColor = .black
            peopleLabelBackgroundView.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var peopleLabel: UILabel! {
        didSet {
            peopleLabel.text = "Participantes"
            peopleLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 17)
            peopleLabel.textColor = .white
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.registerNib(for: PersonCollectionViewCell.self)
            collectionView.allowsSelection = false
        }
    }
    
    var people: [Person]?

    func configure(with people: [Person]?) {
        self.people = people
        collectionView.reloadData()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let people = people,
            let cell: PersonCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath) else {
                return UICollectionViewCell()
        }
        cell.configure(with: people[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people?.count ?? 0
    }
}


//
//extension PeopleTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: 102, height: 100)
//        return size
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//}
