//
//  AppCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/04/22.
//

import Foundation
import UIKit

class AppCoordinatorArchitecture: CoordinatorArchitecture {
    
    //MARK: - Variables
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let navigationController = navigationController {
            let auth = AuthenticationCoordinator(navController: navigationController)
            auth.start()
        }
    }
}
