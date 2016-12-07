//
//  ScheduleTableViewCell.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var programNameLabel: UILabel!
    
    @IBOutlet weak var timeSepLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        timeSepLabel.text = "-"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
