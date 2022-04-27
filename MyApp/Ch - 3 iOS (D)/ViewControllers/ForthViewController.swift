//
//  ForthViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 11/03/22.
//

import UIKit

class ForthViewController: UIViewController {
    
    //MARK: - Variables
    var coordinator: ForthCoordinator?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func gotoRoot(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
