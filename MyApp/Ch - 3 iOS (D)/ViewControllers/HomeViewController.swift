//
//  HomeViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 10/03/22.
//

import UIKit


class HomeViewController: UIViewController, DataPassingDelegate {
 
    //MARK: - Outlets
    @IBOutlet weak var lblBackHome: UILabel!
   
    //MARK: - Variables
    var message = ""
    var firstVcDelegate: DataPassingDelegate?
    var coordinator: HomeCoordinator?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        if let navController = self.navigationController {
            coordinator = HomeCoordinator(navController)
        }
    }
    
    //MARK: - Action
    @IBAction func gotoHome(segue: UIStoryboardSegue){ }

    @IBAction func gotoFirst(_ sender: UIButton) {
       coordinator?.gotoFirst(self)
    }
    
    //MARK: - Functions
    func getData(_ value: String) {
        lblBackHome.text = value
    }
}
