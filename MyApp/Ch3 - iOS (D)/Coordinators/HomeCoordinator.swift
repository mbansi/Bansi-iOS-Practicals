//
//  HomeCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/03/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let home = UIStoryboard(name: Constants.navigationController, bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            home.coordinator = self
            navController?.pushViewController(home, animated: true)
        }
    }
    
    func gotoFirst(_ delegate: DataPassingDelegate) {
        if let navController = navController {
            let firstCoordinator = FirstCoordinator(navController)
            firstCoordinator.startWithData(delegate)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        //to pop to root view controller
    }

}
