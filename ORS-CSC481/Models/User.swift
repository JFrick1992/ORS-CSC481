//
//  User.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class User: PFUser {
    @NSManaged var isAdmin : Bool
    
    override init() {
        super.init()
    }
    
    init(_ username: String, _ password: String, _ email: String) {
        super.init()
        self.username = username
        self.password = password
        self.email = email
        self.isAdmin = false
    }
}