//
//  ApplicantNameResumeViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/9/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class ApplicantNameResumeViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var userResumeTextField: UITextView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Resmue field design
        self.userResumeTextField.layer.backgroundColor = UIColor.white.cgColor
        self.userResumeTextField.layer.borderColor = UIColor.darkGray.cgColor
        self.userResumeTextField.layer.borderWidth = 3
        //First name field design
        self.firstNameTextField.layer.borderWidth = 3
        self.firstNameTextField.layer.borderColor = UIColor.darkGray.cgColor
        //Last name field design
        self.lastNameTextField.layer.borderWidth = 3
        self.lastNameTextField.layer.borderColor = UIColor.darkGray.cgColor
        //Continue button design
        self.continueButton.layer.borderWidth = 3
        self.continueButton.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapContinue(_ sender: Any) {
        let isFirstNameEmpty = (self.firstNameTextField.text?.isEmpty)!
        let isLastNameEmpty = (self.lastNameTextField.text?.isEmpty)!
        let isResumeFieldEmpty = self.userResumeTextField.text.isEmpty
        
        if !isLastNameEmpty && !isFirstNameEmpty {
            let user = PFUser.current() as! User
            user.firstName = self.firstNameTextField.text!
            user.lastName = self.lastNameTextField.text!
            if isResumeFieldEmpty {
                user.resume = "nil"
            } else {
                user.resume = self.userResumeTextField.text
            }
            user.saveInBackground()
            self.performSegue(withIdentifier: "toApplicantHub", sender: nil)
        }
    }
    

}
