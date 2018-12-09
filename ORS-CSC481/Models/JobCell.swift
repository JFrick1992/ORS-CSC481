//
//  JobCell.swift
//  ORS-CSC481
//
//  Created by Junior on 12/8/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse

class JobCell: UITableViewCell {

    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var jobDescription: UILabel!
    
    @IBOutlet weak var applicantList: UILabel!
    
    var job : Job!{
        didSet{
            self.jobTitle.text = job.jobTitle
            self.jobDescription.text = job.jobDescription
            self.applicantList.text = job.applicants.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
