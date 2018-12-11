//
//  HrCreateAPostViewController.swift
//  ORS-CSC481
//
//  Created by Junior on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class HrCreateAPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var keywordTableView: UITableView!
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var jobDescriptionTextView: UITextView!
    var keywords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.keywordTableView.layer.borderWidth = 2
        self.keywordTableView.layer.borderColor = UIColor.darkGray.cgColor
        
        self.jobTitleTextField.layer.borderColor = UIColor.darkGray.cgColor
        self.jobTitleTextField.layer.borderWidth = 2
        
        self.jobDescriptionTextView.layer.borderColor = UIColor.darkGray.cgColor
        self.jobDescriptionTextView.layer.borderWidth = 2
        
        self.keywordTextField.layer.borderColor = UIColor.darkGray.cgColor
        self.keywordTextField.layer.borderWidth = 2
        
        self.keywordTableView.delegate = self
        self.keywordTableView.dataSource = self
    }

    @IBAction func didTapCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "toHRHub", sender: nil)
    }
    
    @IBAction func didTapCreate(_ sender: Any) {
        if !((self.jobTitleTextField.text?.isEmpty)! && self.jobDescriptionTextView.text.isEmpty) {
            let newJob = Job(jobTitleTextField.text!, jobDescriptionTextView.text)
            newJob.keyWords = self.keywords
            newJob.saveInBackground()
            self.performSegue(withIdentifier: "toHRHub", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapAddKeyWorld(_ sender: Any) {
        if !(self.keywordTextField.text?.isEmpty)! {
            self.keywords.append(self.keywordTextField.text!)
            self.keywordTextField.text = ""
            self.keywordTableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.keywords.count > 0 {
            return self.keywords.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.keywordTableView.dequeueReusableCell(withIdentifier: "KeywordCell", for: indexPath) as! KeywordCell
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1
        if self.keywords.count > 0 {
            cell.keywordLabel.text = self.keywords[indexPath.row]
        } else {
            cell.keywordLabel.text = "No Keywords Added"
        }
        return cell
    }

}
