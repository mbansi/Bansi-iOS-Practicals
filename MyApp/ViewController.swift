//
//  ViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 11/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openAutoLayouts(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.basicAutoLayout , sender: self)
    }
    
}

