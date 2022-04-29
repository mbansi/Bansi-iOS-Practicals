//
//  User.swift
//  MyApp
//
//  Created by Bansi Mamtora on 12/04/22.
//

import Foundation

enum Validations: Error {
    case emptyUsername
    case emptyPassword
    case invalidPassword
    case validData
}

struct User {
    let username: String
    let password: String
    
    func isValid() throws {
        if username.isEmpty {
            throw Validations.emptyUsername
        }
        else if password.isEmpty {
            throw Validations.emptyPassword
        }
        else if password.count < Constants.eight {
            throw Validations.invalidPassword
        }
        else {
            throw Validations.validData
        }
    }
}

