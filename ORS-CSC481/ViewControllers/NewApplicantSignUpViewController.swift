//
//  NewApplicantSignUpViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class NewApplicantSignUpViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapRegister(_ sender: Any) {
        let isPasswordEmpty = (self.passwordLabel.text?.isEmpty)!
        let isUsernameEmpty = (self.usernameLabel.text?.isEmpty)!
        let isEmailEmpty = (self.emailLabel.text?.isEmpty)!
        
        if !isPasswordEmpty && !isUsernameEmpty && !isEmailEmpty {
            ParseAPIManager.signUpUser(self.usernameLabel.text!, self.passwordLabel.text!, self.emailLabel.text!) { (user, error) in
                if let user = user {
                    print(user.username!)
                    self.performSegue(withIdentifier: "SignUpToAppHub", sender: nil)
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
