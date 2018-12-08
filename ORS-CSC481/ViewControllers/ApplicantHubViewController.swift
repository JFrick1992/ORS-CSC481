//
//  ApplicantHubViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class ApplicantHubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapLogOut(_ sender: Any) {
       PFUser.logOut()
        self.performSegue(withIdentifier: "AppHubToMainPage", sender: nil)
    }
    

}
