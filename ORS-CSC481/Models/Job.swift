//
//  Job.swift
//  ORS-CSC481
//
//  Created by Junior on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation
import Parse

class Job : PFObject, PFSubclassing
{
    @NSManaged var jobTitle:String
    @NSManaged var jobDescription: String
    @NSManaged var applicants: [String]  //Array of users object ids
    
    override init()
    {
        super.init()
    }
    init(_ title: String, _ description: String)
    {
        super.init()
        self.jobTitle = title
        self.jobDescription = description
        self.applicants = [String]()    //This will have to change to look for users based on their ids
    }
    
    static func parseClassName() -> String {
        return "Job"
    }
}
