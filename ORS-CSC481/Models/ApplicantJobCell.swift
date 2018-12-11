//
//  ApplicantJobCell.swift
//  ORS-CSC481
//
//  Created by Jacob Frick on 12/9/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class ApplicantJobCell: UITableViewCell {
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var applicantStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
