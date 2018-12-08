//
//  NewApplicant.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class Applicant : PFUser {
    override init() {
        super.init()
        let acl = PFACL()
        acl.setReadAccess(true, forRoleWithName: "Admin")
        acl.setWriteAccess(true, forRoleWithName: "Admin")
        self.acl = acl
    }
    
    

}
