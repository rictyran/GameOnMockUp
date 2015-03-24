//
//  PlayerData.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit


let _mainData: PlayerData = PlayerData()
    
  
    class PlayerData: NSObject {
        
        var selectedVenue: [String:AnyObject]?
        
        var selectedPlayer: PFObject?
        
        var profileItems: [PFObject] = []
        
        
        class func mainData() -> PlayerData {
            
            return _mainData
            
            
        }
        
        
        func refreshProfileItems(completion: () -> ()) {
            
            var profileQuery = PFQuery(className: "Player")
            
            profileQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
                
                if objects.count > 0 {
                    
                    self.profileItems = objects as [PFObject]
                    
                    
                    
                }
                
                completion()
                
            }
            
        }
        
        func refreshMyProfileItems(completion: () -> ()) {
            
            var profileQuery = PFQuery(className: "Player")
            
            profileQuery.whereKey("creator", equalTo: PFUser.currentUser())
            
            profileQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
                
                self.profileItems = objects as [PFObject]
                
                
                completion()
                
                
            }
            
            
            
        }
        
        
        
}


