//
//  LoginScreenViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 28/04/22.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard(view)
        self.tfEmail.delegate = self
        self.tfPassword.delegate = self
        tfEmail.keyboardType = .emailAddress
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        if let music = UIStoryboard(name: Constants.loginStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.musicViewController) as? MusicViewController {
            navigationController?.pushViewController(music, animated: true)
            
        }
        
    }
    
    @IBAction func loginWithFacebookAction(_ sender: UIButton) {
        showAlert( NSLocalizedString("Facebook Account Required", comment: ""),self)
    }
    
    @IBAction func loginWithGoogleAction(_ sender: Any) {
        showAlert(NSLocalizedString("Google Account Required", comment: "") ,self)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        if let signUp = UIStoryboard(name: Constants.loginStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.signUpScreenViewController) as? SignUpScreenViewController {
            navigationController?.pushViewController(signUp, animated: true)
        }
    }
    
    private func switchField(_ textField: UITextField) {
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

extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchField(textField)
        return true
    }
}
