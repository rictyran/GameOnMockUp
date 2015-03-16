//
//  PlayerTableViewController.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    
    @IBAction func matchUp(sender: AnyObject) {
        //match up player preferences
        
        
    }
    
    
    var players: [PFObject] = []
    
    let postTitles = [""];
    
    let ageRange = [""]
    
    var postShown = [Bool](count: 6, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        var geoCoder = CLGeocoder()
        
//        PFUser.currentUser()["zipCode"]
        
        geoCoder.geocodeAddressString("30092", completionHandler: { (placemarks, error) -> Void in
            
            for placemark in placemarks as [CLPlacemark] {
                
                let l = placemark.location
                
            }
            
        })
        
        var selfLocation = CLLocation()
        
        var playerQuery = PFQuery(className: "playerProfile")
        
        playerQuery.whereKey("location", nearGeoPoint: PFGeoPoint(location: selfLocation), withinMiles: 5)
        
        playerQuery.whereKey("ageRange", containedIn: ["20-29","30-39"])
        playerQuery.whereKey("skillLevel", containedIn: [""])
        playerQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            // update players = objects & reloadData
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return postTitles.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PlayersTableViewCell
        
        // Configure the cell...   If let statments
        
        cell.titleLabel.text = postTitles[indexPath.row]

        cell.subtitleLabel.text = ageRange[indexPath.row]
//        if let playerProfile["firstName"] as? String {
//            cell.titleLabel.text = playerProfile
//        }
//        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Determine if the post is displayed. If yes, we just return and no animation will be created
        if postShown[indexPath.row] {
            return;
        }
        
        // Indicate the post has been displayed, so the animation won't be displayed again
        postShown[indexPath.row] = true
        
        
        // Define the initial state (Before the animation)
        // cell.alpha = 0
        
        // Define the final state (After the animation)
        // UIView.animateWithDuration(1.0, animations: { cell.alpha = 1 })
        
        
        // Define the initial state (Before the animation)
        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180.0);
        //        let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1);
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        cell.layer.transform = rotationTransform;
        
        // Define the final state (After the animation)
        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
        
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
