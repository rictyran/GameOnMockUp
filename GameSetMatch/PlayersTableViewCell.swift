//
//  PlayersTableViewCell.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var skillLabel: UILabel!
    
    @IBOutlet weak var locLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var postImageView:UIImageView!
    
    var userImage: PFObject? {
        
        didSet {
            
            let userImageFile = userImage?["avatar"] as PFFile
            
            userImageFile.getDataInBackgroundWithBlock {
                (imageData: NSData!, error: NSError!) -> Void in
                
                if error == nil {
                    
                    let image = UIImage(data:imageData)
                    self.postImageView.image = image
                    println("got the image")
                } else {
                    println("fail")
                }
                
            }
            
        }
    }

    
    
    
//    func getProfileImage(){
//        
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
