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
    
    @IBAction func btnUIComponents(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.uiComponents, sender: self)
    }

    @IBAction func openNavigationController(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.navigation, sender: self)
    }
    
    @IBAction func openArchitecture(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.architecture, sender: self)
    }
    
    @IBAction func openWebServices(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.webServices, sender: self)
    }
}

