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
    var username = Dynamic<String?>(nil)
    var data: UserData?
    
    //MARK: - Functions
    func validateData(username: String, password: String) -> Bool {
        if username.isEmpty{
            onValidationError?("Username Required!")
            return false
        }
        else if password.isEmpty {
            onValidationError?("Password Required!")
            return false
        }
        else if password.count < Constants.eight {
            onValidationError?("Password is too short!")
            return false
        }
        else {
            data = UserData(username: username, password: password)
            self.username.value = data?.username
            onLoginSuccess?("Login Successful!")
            return true
        }
    }
}
