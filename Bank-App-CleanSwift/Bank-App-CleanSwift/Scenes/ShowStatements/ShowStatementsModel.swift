//
//  ShowStatementsModel.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

enum ShowStatements {
    // MARK: - For manage user description
    struct UserAccountDescriptionFields {
        var name: String
        var accountWithAgency: String
        var balance: String
    }
    enum UserAccountDescription {
        struct Request {
            var userAccount: UserAccount?
        }
        
        struct Response {
            var userAccount: UserAccount?
        }
        
        struct ViewModel {
            var fields: UserAccountDescriptionFields
        }
    }
    
    // MARK: - For manage statements
    struct ShowStatementsFields {
        var name: String
        var accountWithAgency: String
        var balance: String
    }
    enum ShowStatements {
        struct Request {
            var userId: Int?
        }
        
        struct Response {
            //var userAccount: UserAccount?
        }
        
        struct ViewModel {
            //var fields: UserAccountDescriptionFields
        }
    }
    

    
}


