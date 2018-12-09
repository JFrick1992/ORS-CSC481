//
//  HrCurrentPostsViewController.swift
//  ORS-CSC481
//
//  Created by Junior on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class HrCurrentPostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var jobs = [Job]()
    var user = User()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        getJobList()
        // Do any additional setup after loading the view.
    }
    
    func getJobList()
    {
        let query = PFQuery(className: "Job")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let object = objects
            {
                self.jobs = object as! [Job]
                self.tableView.reloadData()
            }
            else
            {
                print(error?.localizedDescription)
            }
            
        }
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.performSegue(withIdentifier: "toHRHub", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.jobs.count > 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell") as! JobCell
            cell.job = self.jobs[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
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
