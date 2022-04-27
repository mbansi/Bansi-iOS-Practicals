//
//  FirstCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/03/22.
//

import UIKit

class FirstCoordinator: Coordinator {
    
    //MARK: - Variables
    var navController: UINavigationController?
    
    //MARK: - Functions
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() { }
    
    func startWithData(_ delegate: DataPassingDelegate) {
        if let first = UIStoryboard(name: Constants.navigationController, bundle: nil).instantiateViewController(withIdentifier: Constants.firstViewController) as? FirstViewController {
            first.coordinator = self
            first.delegate = delegate
            navController?.pushViewController(first, animated: true)
        }
    }
    
    func gotoSecond(_ message: String) {
        if let navController = navController {
            let secondCoordinator = SecondCoordinator(navController)
            secondCoordinator.startWithData(message)
        }
    }
    

    func gotoVC4() {
        if let navController = navController {
            let forthCoordinator = ForthCoordinator(navController)
            forthCoordinator.start()
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
}
