//
//  HRRepHubViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class HRRepHubViewController: UIViewController {

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
        self.performSegue(withIdentifier: "HRHubToMainPage", sender: nil)
    }
    
    @IBAction func didTapCurrentPosts(_ sender: Any) {
        self.performSegue(withIdentifier: "ToCurrentPosts", sender: nil)
    }
    
    @IBAction func didTapCreatePosts(_ sender: Any) {
        self.performSegue(withIdentifier: "ToCreatePosts", sender: nil)
    }
    
    
}
