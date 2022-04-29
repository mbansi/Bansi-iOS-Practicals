//
//  LoginVewModel.swift
//  MyApp
//
//  Created by Bansi Mamtora on 14/04/22.
//

import Foundation

class LoginViewModel: NSObject {
    
    //MARK: - Variables
    var onValidationError: ((String) -> Void)?
    var onLoginSuccess: ((String) -> Void)?
    var email = Dynamic<String?>(nil)
    var data: UserData?
    
    //MARK: - Functions
    func validateData(email: String, password: String) {
        if email.isEmpty{
            onValidationError?("Username Required!")
            
        }
        else if password.isEmpty {
            onValidationError?("Password Required!")
        }
        else if password.count < Constants.eight {
            onValidationError?("Password is too short!")
        }
        else {
            data = UserData(username: email, password: password)
            self.email.value = data?.username
            onLoginSuccess?("Login Successful!")
        }
    }
}
