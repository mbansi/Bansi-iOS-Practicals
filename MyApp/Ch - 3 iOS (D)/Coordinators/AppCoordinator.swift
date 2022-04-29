//
//  AppCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/03/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Variables
    var navController: UINavigationController?
    
    //MARK: - Functions
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let navController = navController {
            let main = MainCoordinator(navController)
            main.start()
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        //to pop to rootview controller
    }
}
