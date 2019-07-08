//
//  EventDetailViewController.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

import UIKit
import Kingfisher

class EventDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.allowsSelection = false
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerNib(for: EventDescriptionTableViewCell.self)
            tableView.registerNib(for: PeopleTableViewCell.self)
            tableView.registerNib(for: PriceTableViewCell.self)
        }
    }
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateBackgroundView: UIView! {
        didSet {
            dateBackgroundView.backgroundColor = UIColor.secondaryColor
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 17)
            dateLabel.textColor = .white 
        }
    }
    
    private let viewModel: EventDetailViewModelProtocol?
    
    init(viewModel: EventDetailViewModelProtocol? = nil) {
        self.viewModel = viewModel
        super.init(nibName: Constants.Xibs.EventDetailViewController.xib, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configBind()
        viewModel?.loadData()
    }
    
    func configBind() {
        viewModel?.event.bind(listener: { [weak self] (event) in
            guard let self = self else { return }
            guard let event = event,
                  let imageUrlString = event.image,
                let url = URL(string: imageUrlString) else { return }
            
            let resource = ImageResource(downloadURL: url, cacheKey: imageUrlString)
            self.eventImageView.kf.indicatorType = .activity
            self.eventImageView.kf.setImage(with: resource,
                                                  placeholder: UIImage(named: "placeholder"),
                                                  options: [.transition(.fade(1)),
                                                            .cacheOriginalImage])
            self.dateLabel.text = "\(event.dateString) às \(event.eventTime)h"
            self.tableView.reloadData()
        })
    }
}

extension EventDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let event = viewModel?.event.value else { return UITableViewCell() }
        switch indexPath.row {
        case EventDetailModel.description.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Util.className(for: EventDescriptionTableViewCell.self)) as? EventDescriptionTableViewCell {
                cell.configure(with: event)
                return cell
            }
        case EventDetailModel.people.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Util.className(for: PeopleTableViewCell.self)) as? PeopleTableViewCell {
                cell.configure(with: event.people)
                return cell
            }
        case EventDetailModel.price.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Util.className(for: PriceTableViewCell.self)) as? PriceTableViewCell {
                cell.configure(with: event)
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventDetailModel.allCases.count
    }
}

extension EventDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
