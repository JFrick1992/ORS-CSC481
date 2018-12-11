//
//  HRRepHubViewController.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class HRRepHubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var jobListTableView: UITableView!
    
    var jobs = [Job]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jobListTableView.delegate = self
        self.jobListTableView.dataSource = self
        self.jobListTableView.layer.borderColor = UIColor.darkGray.cgColor
        self.jobListTableView.layer.borderWidth = 2
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
                self.jobListTableView.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func didTapLogOut(_ sender: Any) {
        PFUser.logOut()
        self.performSegue(withIdentifier: "HRHubToMainPage", sender: nil)
    }

    
    @IBAction func didTapCreatePosts(_ sender: Any) {
        self.performSegue(withIdentifier: "ToCreatePosts", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.jobs.count > 0 {
            return self.jobs.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.jobListTableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 1
        if self.jobs.count > 0 {
            cell.jobTitle.text = self.jobs[indexPath.row].jobTitle
            return cell
        } else {
            cell.jobTitle.text = "No Jobs yet"
            return cell
        }
        
    }
    
    
}
