//
//  FauxCell.swift
//  GameSetMatch
//
//  Created by Jeanie House on 3/25/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class FauxCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
