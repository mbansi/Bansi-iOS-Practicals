//
//  LoginVC.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/04/22.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - Variables
    let viewModel = LoginViewModel()
    var coordinator: AuthenticationCoordinator?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    //MARK: - Actions
    @IBAction func loginAction(_ sender: UIButton) {
        guard let username = tfUsername.text else {
            return
        }
        guard let password = tfPassword.text else {
            return
        }
        viewModel.validateData(email: username, password: password)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        coordinator?.goToSignUp()
    }
    
    //MARK: - Functions
    func bindViewModel() {
        viewModel.onValidationError = { message in
            self.showAlert(message)
        }
        viewModel.onLoginSuccess = { message in
            self.coordinator?.gotoHome()
        }
        viewModel.email.bind{ data in
            guard let data = data else { return }
            self.lblUsername.text = data
        }
    }
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: title, message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
