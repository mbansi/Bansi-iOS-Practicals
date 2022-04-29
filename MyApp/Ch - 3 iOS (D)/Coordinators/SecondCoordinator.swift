//
//  SecondCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/03/22.
//


import UIKit

class SecondCoordinator: Coordinator {
    
    //MARK: - Variables
    var navController: UINavigationController?
    
    //MARK: - Functions
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() { }
    
    func startWithData(_ message: String) {
        if let home = UIStoryboard(name: Constants.navigationController, bundle: nil).instantiateViewController(withIdentifier: Constants.secondViewController) as? SecondViewController {
            home.coordinator = self
            home.message = message
            navController?.pushViewController(home, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
}
