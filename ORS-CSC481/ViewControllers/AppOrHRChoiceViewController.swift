//
//  AppOrHRChoiceViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/7/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class AppOrHRChoiceViewController: UIViewController {
    var isHRRep = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        let rep = HR_Rep("admin", "admin", "admin@admin.com")
        rep.saveInBackground()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapHrView(_ sender: UITapGestureRecognizer) {
        self.isHRRep = true
        performSegue(withIdentifier: "toLogInSegue", sender: nil)
    }
    @IBAction func didTapApplicantView(_ sender: UITapGestureRecognizer) {
        self.isHRRep = false
        performSegue(withIdentifier: "toLogInSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLogInSegue" {
            let dest = segue.destination as! LogInViewController
            dest.isHRRep = self.isHRRep
        }
    }
    
    
}
