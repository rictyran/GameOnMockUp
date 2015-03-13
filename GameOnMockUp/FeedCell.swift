//
//  FeedCell.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/11/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    
    var playerInfo: PFObject? {
        
        didSet {
            
            nameLabel.text = playerInfo?["name"] as? String
            
            
            let userImageFile = playerInfo?["image"] as PFFile
            
            userImageFile.getDataInBackgroundWithBlock {
                
                (imageData: NSData!, error: NSError!) -> Void in
                
                if error == nil {
                    
                    let image = UIImage(data:imageData)
                    
                    self.profileImageView.image = image
                    
                }
            }
            
        }
   }
    
   
    
  
    
    @IBOutlet weak var profileImageView: UIImageView!
   
    
    @IBOutlet weak var nameLabel: UILabel!
  
    
    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBAction func chatButton(sender: AnyObject) {
    }
    
  
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
