//
//  FeedbackVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/22/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class FeedbackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitFeedback(sender: AnyObject) {
    
    var playerRating = PFObject(className: "PlayerRating")

        playerRating["creator"] = PFUser.currentUser()
        
//        playerRating["item"] = itemField.text
//        playerRating["venue"] = venueField.text
//        playerRating["dueDate"] = "\(datePicker.date)"
        
//        playerRating.saveInBackground()
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
