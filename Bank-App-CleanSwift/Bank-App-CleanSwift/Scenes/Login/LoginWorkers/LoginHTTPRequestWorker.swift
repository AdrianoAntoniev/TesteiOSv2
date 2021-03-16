//
//  LoginWorker.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation
import Alamofire

/// Worker class for POST http request.
class LoginHTTPRequestWorker {
    
    /// Make a `post` request with the parameters `user` and `password` presents inside `user` object.
    /// - Parameter user: an `User` objects, containing an `username` and a `password`
    /// - Returns: an `UserData` optional object
    func doLogin(with user: User) -> UserData? {
        var userData: UserData?
        
        let endpoint = "https://bank-app-test.herokuapp.com/api/login/"
        let headers: HTTPHeaders = [.contentType("application/json; charset=utf-8")]
        
        let request = AF.request(endpoint,
                                 method: .post,
                                 parameters: UserParameters(user: user.username, password: user.password),
                                 encoder: JSONParameterEncoder.default,
                                 headers: headers)
        
        request.responseDecodable(of: UserData.self) { response in
            userData = response.value
        }
        
        return userData
    }    
}
