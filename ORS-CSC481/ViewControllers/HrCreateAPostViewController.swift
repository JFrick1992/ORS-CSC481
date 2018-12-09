//
//  HrCreateAPostViewController.swift
//  ORS-CSC481
//
//  Created by Junior on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class HrCreateAPostViewController: UIViewController {

    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var jobDescriptionTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "toHRHub", sender: nil)
    }
    
    @IBAction func didTapCreate(_ sender: Any) {
        if !((self.jobTitleTextField.text?.isEmpty)! && self.jobDescriptionTextView.text.isEmpty)
        {
            let newJob = Job(jobTitleTextField.text!, jobDescriptionTextView.text)
            newJob.saveInBackground()
            self.performSegue(withIdentifier: "toHRHub", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
