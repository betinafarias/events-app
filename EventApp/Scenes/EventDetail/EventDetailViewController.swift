//
//  EventDetailViewController.swift
//  EventApp
//
//  Created by betina farias on 07/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

import UIKit

class EventDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.allowsSelection = false
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerNib(for: HeaderTableViewCell.self)
            tableView.registerNib(for: EventDescriptionTableViewCell.self)
            tableView.registerNib(for: PeopleTableViewCell.self)
            tableView.registerNib(for: PriceTableViewCell.self)
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
        viewModel?.delegate = self
        configBind()
        viewModel?.loadData()
    }
    
    func configBind() {
        viewModel?.event.bind(listener: { [weak self] (event) in
            guard let self = self else { return }
            self.tableView.reloadData()
        })
    }
}

extension EventDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let event = viewModel?.event.value else { return UITableViewCell() }
        switch indexPath.row {
        case EventDetailModel.header.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Util.className(for: HeaderTableViewCell.self)) as? HeaderTableViewCell {
                cell.configure(with: event)
                return cell
            }
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
                cell.delegate = self
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

extension EventDetailViewController: PriceTableViewCellDelegate {
    func didTapCheckin() {
        let alertController = UIAlertController(title: "Fazer check in", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Seu nome"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Seu e-mail"
        }
        
        let saveAction = UIAlertAction(title: "Confirmar", style: UIAlertAction.Style.default, handler: { [weak self] alert -> Void in
            guard let self = self else { return }
            
            guard let textFields = alertController.textFields else {
                return
            }
            
            guard let name = textFields[0].text, name.isEmpty == false,
                let email = textFields[1].text, email.isEmpty == false else {
                    let alert = UIAlertController(title: "Preencha todos os campos", message: "", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    return
            }
            
            self.viewModel?.checkin(name: name, email: email)
        })
        let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension EventDetailViewController: EventViewModelDelegate {
    func showCheckinSucceededAlert() {
        let alert = UIAlertController(title: "Check in feito com sucesso.", message: "", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
}
