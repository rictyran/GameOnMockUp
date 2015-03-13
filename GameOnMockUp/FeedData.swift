//
//  FeedData.swift
//  GameOn
//
//  Created by Jeanie House on 3/10/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit


let _mainData: FeedData = FeedData()

class FeedData: NSObject {
    
    var selectedVenue: [String:AnyObject]?

    var selectedPlayer: PFObject?
    
    var feedItems: [PFObject] = []

    
    class func mainData() -> FeedData {
        
        return _mainData
        
        
    }
    
    
    func refreshFeedItems(completion: () -> ()) {
        
        var feedQuery = PFQuery(className: "Player")
        
        feedQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if objects.count > 0 {
            
            self.feedItems = objects as [PFObject]
                
               
                
        }
            
             completion()
        
    }
    
}
    
    func refreshMyFeedItems(completion: () -> ()) {
        
        var feedQuery = PFQuery(className: "Player")
        
        feedQuery.whereKey("creator", equalTo: PFUser.currentUser())
        
        feedQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
   //         if objects.count > 0 {
                
                self.feedItems = objects as [PFObject]
                
                
                
//            }
            
            completion()
        
        
    }
   


    }



}//END
