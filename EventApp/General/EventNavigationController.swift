//
//  EventNavigationController.swift
//  EventApp
//
//  Created by betina farias on 08/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import UIKit

class EventNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = .white
        self.navigationBar.backgroundColor = .white
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.font(ofFamily: .ralewaySemibold, withSize: 18)
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                 NSAttributedString.Key.font: UIFont.font(ofFamily: .ralewayBold, withSize: 26)]
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
}
