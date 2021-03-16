//
//  User.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

struct User {
    let username: String
    let password: String
}

/// Struct for request body parameters
struct UserParameters: Encodable {
    let user: String
    let password: String
}
