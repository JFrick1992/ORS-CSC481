//
//  ApplicantHubViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class ApplicantHubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sideBarMenuView: UIView!
    @IBOutlet weak var jobPostingsTableView: UITableView!
    
    @IBOutlet weak var sideBarMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainViewTrailingConstraint: NSLayoutConstraint!
    var isSideBarOut = false
    var jobs = [Job]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jobPostingsTableView.dataSource = self
        self.jobPostingsTableView.delegate = self
        self.jobPostingsTableView.layer.borderColor = UIColor.darkGray.cgColor
        self.jobPostingsTableView.layer.borderWidth = 2
        self.fetchJobs()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchJobs() {
        ParseAPIManager.getAllJobs { (jobs, error) in
            if let jobs = jobs {
                self.jobs = jobs
                self.jobPostingsTableView.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func didTapLogOut(_ sender: Any) {
       PFUser.logOut()
        self.performSegue(withIdentifier: "AppHubToMainPage", sender: nil)
    }

    @IBAction func didTapMenu(_ sender: Any) {
        if !isSideBarOut {
            self.sideBarMenuLeadingConstraint.constant = 0
            self.mainViewTrailingConstraint.constant = 140
            self.isSideBarOut = true
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        } else {
            self.sideBarMenuLeadingConstraint.constant = -140
            self.mainViewTrailingConstraint.constant = 0
            self.isSideBarOut = false
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.jobs.count > 0 {
            return self.jobs.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.jobPostingsTableView.dequeueReusableCell(withIdentifier: "ApplicantJobCell", for: indexPath) as! ApplicantJobCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.darkGray.cgColor
        if self.jobs.count > 0 {
            cell.jobTitle.text = self.jobs[indexPath.row].jobTitle
            if self.jobs[indexPath.row].didUserApply() {
                cell.applicantStatus.text = "Status: Applied"
            } else {
                cell.applicantStatus.text = "Status: Not Applied"
            }
        } else {
            cell.jobTitle.text = "No Jobs Listed"
            cell.applicantStatus.text = ""
        }
        return cell
    }
    
}
