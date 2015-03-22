//
//  PendingTableViewCell.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/20/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PendingTableViewCell: UITableViewCell {
    
   
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
