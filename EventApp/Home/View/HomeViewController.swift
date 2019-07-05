//
//  HomeViewController.swift
//  EventApp
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: Constants.Xibs.HomeViewController.xib, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) for \(Constants.Xibs.SplashViewController.xib) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
