//
//  SplashViewController.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var appNameLabel: UILabel! {
        didSet {
            appNameLabel.text = Constants.Xibs.SplashViewController.title
            appNameLabel.font = UIFont.font(ofFamily: .ralewayBold, withSize: 34)
            appNameLabel.textColor = .white
        }
    }
    
    private let viewModel: SplashViewModelProtocol
    private let animationDuration = 1.2
    
    init(viewModel: SplashViewModelProtocol = SplashViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: Constants.Xibs.SplashViewController.xib, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) for \(Constants.Xibs.SplashViewController.xib) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateSplash()
    }
    
    func animateSplash() {
        UIView.animate(withDuration: animationDuration, animations: { [weak self] in
            guard let height = self?.view.bounds.height else { return }
            self?.appNameLabel.center.y = height
        }, completion: { [weak self] _ in
            self?.viewModel.navigate()
        })
    }
}
