//
//  HomeCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/04/22.
//

import Foundation
import UIKit
class HomeCoordinatorArchitecture: CoordinatorArchitecture {
    
    //MARK: - Variables
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        guard let dataVC = UIStoryboard(name: Constants.home, bundle: nil).instantiateViewController(withIdentifier: Constants.dataVC) as? DataVC else {
            return
        }
        dataVC.coordinator = self
        navigationController.pushViewController(dataVC, animated: true)
    }
}
