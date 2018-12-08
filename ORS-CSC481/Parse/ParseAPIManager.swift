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
    let parseLink = "http://parse-chat-1224.herokuapp.com/parse"
    let app_name = "ors-csc481"
    let master_key = "helloworld"
    
    
    static func logInUserHR_Rep(_ username: String, _ password: String, completion: @escaping(HR_Rep?, Error?)->()) {
        
    }
    static func logInUserApplicant(_ username: String, _ password: String, completion: @escaping(Applicant?, Error?)->()) {
        
    }
}

