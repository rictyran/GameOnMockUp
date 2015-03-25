//
//  FauxTVC.swift
//  GameSetMatch
//
//  Created by Jeanie House on 3/25/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class FauxTVC: UITableViewController {
    
      var postShown = [Bool](count: 10, repeatedValue: false)
    
    var names = [String]()
    var dates = [String]()
    var location = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        names = ["Ellie",
            "Alex",
            "John",
            "Emily",
            "Robert"]
        
        dates = ["3/27/15, 5:00 PM",
            "3/28/15, 1:00 PM",
            "3/29/15, 4:00 PM",
            "3/30/15, 7:00 PMv",
            "3/21/15, 6:00 PM"]
        
        location = ["Atlanta Athletic Club",
            "Piedmont Park Tennis Courts",
            "Laurel Park",
            "Bitsy Grant",
            "Sugarloaf Country Club"]
        

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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return names.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("fauxCell", forIndexPath: indexPath) as FauxCell
        
        
        let row = indexPath.row
        
        cell.nameLabel.text = names[row]
       cell.dateLabel.text = dates[row]
        cell.locationLabel.text = location[row]
        
        return cell
        
        
//        let cell2 = tableView.dequeueReusableCellWithIdentifier("fauxCell2", forIndexPath: indexPath) as FauxCell
//         let cell3 = tableView.dequeueReusableCellWithIdentifier("fauxCell3", forIndexPath: indexPath) as FauxCell
//
//        cell.nameLabel.text = "Jane"
//        cell.dateLabel.text = "3/27/15, 7:00 PM"
//        cell.locationLabel.text = "3/27/15, 7:00 PM"
//        
//        cell2.nameLabel.text = "Alex"
//        cell2.dateLabel.text = "3/29/15, 4:00 PM"
//        cell2.locationLabel.text = "Atlanta Athletic Club"
//       
//        cell3.nameLabel.text = "John"
//        cell3.dateLabel.text = "3/27/15, 7:00 PM"
//        cell3.locationLabel.text = "Grant Park Tennis Courts"
        
       
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
