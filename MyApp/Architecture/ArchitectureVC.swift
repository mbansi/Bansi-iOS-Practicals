//
//  ArchitectureVC.swift
//  MyApp
//
//  Created by Bansi Mamtora on 15/04/22.
//

import UIKit

class ArchitectureVC: UIViewController {
    
    //MARK: - Variables
    var appCoordinator: AppCoordinatorArchitecture?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func mvvmAction(_ sender: UIButton) {
        guard let navController = self.navigationController else {
            return
        }
        appCoordinator = AppCoordinatorArchitecture(navigationController: navController)
        appCoordinator?.start()
    }
}
