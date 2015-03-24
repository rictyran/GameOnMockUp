//
//  PushTest.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/24/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

//var user: PFUser!
//var messages: [PFObject] = []

class PushTest: UIViewController {

    var user: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func pushUp(sender: AnyObject) {
       
        testPush()
        
    }
    
    func testPush() {
        
        var pushUp = PFObject(className:"Invitation")
        
        pushUp["senderId"] = PFUser.currentUser().objectId
        pushUp["receiverId"] = "a4bj3ilq6c" // user.objectId
        pushUp["participants"] = [PFUser.currentUser().objectId,"a4bj3ilq6c"]
        
        pushUp.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
        
            } else {
                
            }
        
        }
        
        let message = "Someone has invited you to play tennis"
        
        var data = [ "title": "Some Title","alert": message]
        
        var deviceQuery = PFInstallation.query()
        
        deviceQuery.whereKey("userId", equalTo: "a4bj3ilq6c")
        
        var push = PFPush()
//        push.setMessage("Someone has invited you to play tennis")
        push.setQuery(deviceQuery)
        push.setData(data)
        push.sendPushInBackground()
    
    }
    
    
//    let message: NSString = responseMessage.text as NSString
//    
//    var data = [ "title": "Some Title",
//        "alert": message]
//    
//    var userQuery: PFQuery = PFUser.query()
//    userQuery.whereKey("objectId", equalTo: recipientObjectId)
//    var query: PFQuery = PFInstallation.query()
//    query.whereKey("currentUser", matchesQuery: userQuery)
//    
//    var push: PFPush = PFPush()
//    push.setQuery(query)
//    push.setData(data)
//    push.sendPushInBackground()
    
    
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
