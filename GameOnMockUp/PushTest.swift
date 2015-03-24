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
        pushUp["receiverId"] = user.objectId
        pushUp["participants"] = [PFUser.currentUser().objectId,user.objectId]
        
        pushUp.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
        
            } else {
                
            }
        
        }
        
        var deviceQuery = PFInstallation.query()
        
        deviceQuery.whereKey("receiverId", equalTo: user.objectId)
        
        var push = PFPush()
        push.setMessage("Someone has invited you to play tennis")
        push.setQuery(deviceQuery)
        push.sendPush(nil)
    
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
