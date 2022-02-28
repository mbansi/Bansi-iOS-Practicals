//
//  LoginViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 02/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tfEmail: CustomTextField!
    @IBOutlet weak var tfPassword: CustomTextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tfEmail.layer.cornerRadius = 3
        tfEmail.layer.borderColor = UIColor.systemBlue.cgColor
        tfEmail.layer.borderWidth = Constants.one
        
        tfPassword.layer.cornerRadius = 3
        tfPassword.layer.borderColor = UIColor.systemBlue.cgColor
        tfPassword.layer.borderWidth = Constants.one
    }
    

}
