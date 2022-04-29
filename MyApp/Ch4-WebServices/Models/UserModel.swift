//
//  UserModel.swift
//  MyApp
//
//  Created by Bansi Mamtora on 29/03/22.
//

import Foundation

struct Response: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Users]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

struct Users: Codable {
    let id: Int
    let email, firstName, lastName, avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct LoginUser: Codable {
    let email: String
    let password: String
}

struct LoginUserResponse: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decode(String.self, forKey: .token)
    }
}

struct Support: Codable {
    let url: String
    let text: String
}

struct SingleUser: Codable {
    let data: Users
    let support: Support
}

struct CreateUser: Codable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

