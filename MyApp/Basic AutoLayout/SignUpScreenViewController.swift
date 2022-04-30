//
//  SignUpScreenViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 28/04/22.
//

import UIKit

class SignUpScreenViewController: UIViewController {

  
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfFullName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dismissKeyboard(view)
        tfEmail.keyboardType = .emailAddress
        self.tfEmail.delegate = self
        self.tfPassword.delegate = self
        self.tfFullName.delegate = self
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        showAlert(NSLocalizedString("Success", comment: ""), self)
    }
    
    private func switchField(_ textField: UITextField) {
        switch textField {
        case self.tfFullName:
            self.tfEmail.becomeFirstResponder()
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tfPassword.resignFirstResponder()
        default:
            break
        }
    }
    
}

extension SignUpScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchField(textField)
        return true
    }
}
