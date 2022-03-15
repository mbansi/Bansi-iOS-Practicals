//
//  MainCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/03/22.
//


import UIKit

class MainCoordinator: Coordinator {
    
    //MARK: - Variables
    var navController: UINavigationController?
    
    //MARK: - Functions
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let main = UIStoryboard(name: Constants.main, bundle: nil).instantiateViewController(withIdentifier: Constants.viewController) as? ViewController {
            navController?.pushViewController(main, animated: true)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        //to pop to rootview controller
    }

}
