//
//  SecondViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 10/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblMessage: UILabel!
    
    //MARK: - Variables
    var message: String = ""
    var coordinator: SecondCoordinator?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemMint]
            lblMessage.text = message
    }
    
    @IBAction func gotoHome(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
