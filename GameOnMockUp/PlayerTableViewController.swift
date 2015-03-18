//
//  PlayerTableViewController.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func matchUp(sender: AnyObject) {
        //match up player preferences
        
        
    }
    
    
    @IBAction func fiveMileButton(sender: AnyObject) {
        
    }
    @IBAction func tenMileButton(sender: AnyObject) {
        
    }
    @IBAction func twentyMileButton(sender: AnyObject) {
        
    }
    
    
    
    
    
    
    let postImages = ["female2"]
    
    var players: [PFUser] = []
    
    let postTitles = ["Name"]
    
    let ageRange = [""]
    
    let skillLevel = [""]
    
    let gender = ["gender"]
    
    var postShown = [Bool](count: 6, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var chosenAgeRanges:[String] = []
//        var geoCoder = CLGeocoder()
//        var chosenSkillLevel:[String] = []
//        var chosenGender:[String] = []
//        
//        
//        var selfLocation = CLLocation()
//        
//        var playerQuery = PFUser.query()
//        
        
        
                //buttons for narrowing down to 10 and 5 mile radius
//        playerQuery.whereKey("location", nearGeoPoint: PFGeoPoint(location: selfLocation), withinMiles: 20)
//
//        if chosenAgeRanges.count > 0 { playerQuery.whereKey("ageRange", containedIn: chosenAgeRanges) }
//        
//        if chosenSkillLevel.count > 0 { playerQuery.whereKey("skillLevel", containedIn: chosenSkillLevel)}
//        
//        playerQuery.whereKey("gender", containedIn: gender)
//        
//        
//        playerQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            
//            // update players = objects & reloadData
//            self.players = objects as [PFUser]
//            
//            self.tableView.reloadData()
//            
//        }
        
        
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
        //return players.count
        return postTitles.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PlayersTableViewCell
        
        // Configure the cell...   If let statments
        cell.postImageView.image = UIImage(named: postImages[indexPath.row])
//        
 //       let player = players[indexPath.row]
//        
        //cell.titleLabel.text = player["name"] as? String
//
//        cell.subtitleLabel.text = ageRange[indexPath.row]
    // cell.titleLabel.text = postTitles[indexPath.row]
    //  cell.skillLabel.text = skillLevel[indexPath.row]
        
        
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
