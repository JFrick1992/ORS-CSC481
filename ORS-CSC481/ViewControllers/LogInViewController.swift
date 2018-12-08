//
//  LogInViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    var isHRRep = Bool()
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.isHRRep {
            self.registerButton.isHidden = true
        } else {
            self.registerButton.isHidden = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapLogIn(_ sender: Any) {
        if !(self.usernameField.text?.isEmpty)! && !(self.passwordField.text?.isEmpty)! {
            if isHRRep {
                if (self.usernameField.text)! == "admin" {
                    logIn("LogInToHRHUb")
                }
            } else {
                logIn("LogInToAppHub")
            }
        }
    }
    func logIn(_ segueIdentifier: String) {
        ParseAPIManager.logInUser(self.usernameField.text!, self.passwordField.text!) {
            (user, error) in
            if let user = user {
                
                print(user.username!)
                self.performSegue(withIdentifier: segueIdentifier, sender: nil)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}
