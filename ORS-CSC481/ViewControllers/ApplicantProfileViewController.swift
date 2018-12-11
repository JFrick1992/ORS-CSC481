//
//  ApplicantProfileViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/9/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class ApplicantProfileViewController: UIViewController {

    @IBOutlet weak var resumeLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser.current() as! User
        self.firstNameLabel.text = user.firstName
        self.lastNameLabel.text = user.lastName
        if user.resume == "nil" {
            self.resumeLabel.text = "No Resume Submitted"
        } else {
            self.resumeLabel.text = user.resume
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
