//
//  PendingEventsTVC.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/20/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit



class PendingEventsTVC: UITableViewController {

  
    
  var postShown = [Bool](count: 6, repeatedValue: false)
  var pEvents: [PFObject] = []
  var chosenEvent:[String] = []
    
    var pendArray: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //refreshEvents()
        

        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    func refreshEvents() {
//        
//        var queryEvent = PFQuery(className:"Event")
//        
//        queryEvent.getObjectInBackgroundWithId("") {
//            
//            (event: PFObject!, error: NSError!) -> Void in
//            if error == nil && event != nil {
//                
//                println(event)
//                
//            } else {
//                println(error)
//            }
//            
//      }
//       
//        
//        
//    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

 
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
                return pendArray.count
        
       
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> PendingTableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Celly", forIndexPath: indexPath) as PendingTableViewCell
        
        let item = pendArray[indexPath.row]
        
        cell.titleLabel.text = item["cellone"]
        cell.dateLabel.text = item["celltwo"]
        cell.locLabel.text = item["cellthree"]

        return cell
       
    }
    
    
    
    func getPendingEvents() {
     
            
            
        }

        
        
        
    
  

    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if postShown[indexPath.row] {
            return
        }
        
        postShown[indexPath.row] = true
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
