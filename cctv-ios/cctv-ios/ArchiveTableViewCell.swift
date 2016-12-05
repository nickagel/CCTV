//
//  ArchiveTableViewCell.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/5/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ArchiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
