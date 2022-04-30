//
//  AuthenticationCoordinator.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/04/22.
//

import Foundation
import UIKit

class AuthenticationCoordinator: CoordinatorArchitecture {
    
    //MARK: - Variables
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        guard let loginVC = UIStoryboard(name: Constants.authentication, bundle: nil).instantiateViewController(withIdentifier: Constants.loginVC) as? LoginVC else {
            return
        }
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToSignUp() {
        guard let signUpVC = UIStoryboard(name: Constants.authentication, bundle: nil).instantiateViewController(withIdentifier: Constants.signUpVC) as? SignUpVC else {
            return
        }
        signUpVC.coordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func gotoHome() {
        let home = HomeCoordinatorArchitecture(navController: navigationController)
        home.start()
    }
}
