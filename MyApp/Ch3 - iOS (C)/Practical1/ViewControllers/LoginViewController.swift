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
        self.dismissKeyboard(view)
        
        tfEmail.layer.cornerRadius = 3
        tfEmail.layer.borderColor = UIColor.systemBlue.cgColor
        tfEmail.layer.borderWidth = Constants.one
        self.tfEmail.delegate = self
        
        tfPassword.layer.cornerRadius = 3
        tfPassword.layer.borderColor = UIColor.systemBlue.cgColor
        tfPassword.layer.borderWidth = Constants.one
        self.tfPassword.delegate = self
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tfPassword.resignFirstResponder()
        default:
            break
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
}
