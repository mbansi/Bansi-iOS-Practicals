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
        if let login = UIStoryboard(name: Constants.loginStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.loginScreenViewController) as? LoginScreenViewController{
            navigationController?.pushViewController(login, animated: true)
        }
    
    }
    
    @IBAction func btnUIComponents(_ sender: UIButton) {
        if let mainComponents = UIStoryboard(name: Constants.mainComponentsStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.mainComponentsViewController) as? MainComponentsViewController{
            navigationController?.pushViewController(mainComponents, animated: true)
        }
    }

    @IBAction func openNavigationController(_ sender: UIButton) {
        if let navigation = UIStoryboard(name: Constants.navigationStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.homeViewController) as? HomeViewController {
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
    @IBAction func openArchitecture(_ sender: UIButton) {
        if let architecture = UIStoryboard(name: Constants.architectureStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.architectureViewController) as? ArchitectureViewController {
            navigationController?.pushViewController(architecture, animated: true)
        }
    }
    
    @IBAction func openWebServices(_ sender: UIButton) {
        if let loginWeb = UIStoryboard(name: Constants.loginWebStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.loginWebViewController) as? LoginWebViewController {
            navigationController?.pushViewController(loginWeb, animated: true)
        }
    }
}

