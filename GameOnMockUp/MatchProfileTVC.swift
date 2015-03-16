//
//  MatchProfileTVC.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/11/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class MatchProfileTVC: UITableViewController {

    
    @IBAction func directionsButton(sender: AnyObject) {
        
        
        
    }
  
  
    @IBAction func backButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //       refreshFeed()
             self.tableView.rowHeight = 100.0
            
        }
        
        
//       func refreshFeed()  {
//            
//            
//            FeedData.mainData().refreshFeedItems { () -> () in
//                
//                 self.tableView.reloadData()
//                
//            }
//            
        //}
        
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            //refreshFeed()
            
        }
        
        
    
        
        // MARK: - Table view data source
        
        
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            
            
            return 5
        }
        
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> FeedCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("feedCell", forIndexPath: indexPath) as FeedCell
            
            // Configure the cell...
            
            
//            let player = FeedData.mainData().feedItems[indexPath.row]
//        
//            cell.playerProfile = player
//            
            //        cell.textLabel?.text = player["name"] as? String
            
            
            
            return cell
        }
        
        
        
//        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
////            FeedData.mainData().selectedPlayer = FeedData.mainData().feedItems[indexPath.row]
////            
//            
//            var detailVC = storyboard?.instantiateViewControllerWithIdentifier("MatchProfile") as UIViewController
//            
//            navigationController?.pushViewController(detailVC, animated: true)
//            
//            
//        }
//    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       }
