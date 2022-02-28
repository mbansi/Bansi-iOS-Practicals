//
//  TabBarViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate{

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

    }
}
