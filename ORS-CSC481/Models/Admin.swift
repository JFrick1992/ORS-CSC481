//
//  Admin.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse


class Admin: PFRole{
    
    override init() {
        super.init()
        self.name = "Admin"
    }
    
    override static func parseClassName()->String {
        return "Admin"
    }
}
