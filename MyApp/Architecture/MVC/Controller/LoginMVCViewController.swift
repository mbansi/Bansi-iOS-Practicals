//
//  LoginMVCViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 12/04/22.
//

import UIKit

class LoginMVCViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func loginAction(_ sender: UIButton) {
        guard let name = tfUsername.text else{
            return
        }
        guard let password = tfPassword.text else {
            return
        }
        let userModel = User(username: name, password: password)
        
        do {
            try userModel.isValid()
        }
        catch Validations.emptyUsername {
            showAlert("Username Required!")
        }
        catch Validations.emptyPassword {
            showAlert("Password Required!")
        }
        catch Validations.invalidPassword {
            showAlert("Password is too short!")
        }
        catch {
            showAlert("\(userModel.username) is logged in!")
        }
    }
    
    //MARK: - Functions
    func showAlert(_ message: String){
        let alert = UIAlertController(title: title, message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
