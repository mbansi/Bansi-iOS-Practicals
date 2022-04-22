//
//  MainComponentsViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit

class MainComponentsViewController: UIViewController {

    //MARK: - Outlets
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func openTask2(_ sender: UIButton) {
        performSegue(withIdentifier: "practical2", sender: self)
    }
    
    @IBAction func openTask1(_ sender: UIButton) {
        performSegue(withIdentifier: "practical1", sender: sender)
    }
}
