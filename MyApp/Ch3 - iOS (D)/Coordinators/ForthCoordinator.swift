//
//  ForthCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 15/03/22.
//

import Foundation
import UIKit

class ForthCoordinator: Coordinator {
    
    //MARK: - Variables
    var navController: UINavigationController?
    
    //MARK: - Functions
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let forth = UIStoryboard(name: Constants.navigationController, bundle: nil).instantiateViewController(withIdentifier: Constants.forthViewController) as? ForthViewController {
            forth.coordinator = self
            navController?.pushViewController(forth, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
}
