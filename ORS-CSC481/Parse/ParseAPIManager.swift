//
//  ParseAPIManager.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse


class ParseAPIManager {
    static let parseLink = "https://ors-csc481.herokuapp.com/parse"
    static let app_name = "ors-csc481"
    static let master_key = "helloworld"
    
    static func logInUser(_ username: String, _ password: String, completion: @escaping(User?, Error?)->()) {
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if let user = user {
                completion(user as? User, nil)
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
    
    static func signUpUser(_ username: String, _ password: String, _ email: String,
                           completion: @escaping(User?, Error?)->()) {
        let user = User(username, password, email)
        user.signUpInBackground { (success, error) in
            if success {
                completion(user, nil)
        
            } else {
                completion(nil, error)
            }
        }
    }
}

