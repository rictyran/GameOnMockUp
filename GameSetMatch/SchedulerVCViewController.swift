//
//  SchedulerVCViewController.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/19/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

//var cellOne: String!
//var cellTwo: String!
//var cellThree: String!


class SchedulerVCViewController: UIViewController, UIAlertViewDelegate {
    
    var user: PFUser!
    var messages: [PFObject] = []
    
    var playerTable = PlayerTableViewController()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var locLabel: UILabel!
    
    
    @IBAction func mapButton(sender: AnyObject) {
        
        
        var locVC = storyboard?.instantiateViewControllerWithIdentifier("LVC") as LocationPickerVC
        
        locVC.user = user
        
        navigationController?.pushViewController(locVC, animated: true)
        
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
        
        let message = "Someone has invited you to play tennis"
        
        var data = [ "title": "Some Title","alert": message]
        
        var deviceQuery = PFInstallation.query()
        
        deviceQuery.whereKey("userId", equalTo: user.objectId)
        
        var push = PFPush()
        //        push.setMessage("Someone has invited you to play tennis")
        push.setQuery(deviceQuery)
        push.setData(data)
        push.sendPushInBackground()
        
    }
    
    
    @IBAction func saveSendPush(sender: AnyObject) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Notify Player?", message: "Let's Play!", preferredStyle: .Alert)
        
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let sendAction: UIAlertAction = UIAlertAction(title: "Send", style: .Default) { action -> Void in
            //Do some other stuff
            
            self.savingEvent()
            
            //            self.pushMessage()
            self.testPush()
            
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("pendingEventsTVC") as PendingEventsTVC
            
            vc.pendArray = [[ "cellone" : self.nameLabel!.text!, "celltwo" : self.dateLabel!.text!, "cellthree" : self.locLabel!.text! ]]
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        actionSheetController.addAction(sendAction)
        //        //Add a text field
        //        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
        //            //TextField configuration
        //            textField.textColor = UIColor.blueColor()
        //        }
        //
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    private var imageSet = ["image1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let messageQuery = PFQuery(className: "Messages")
        //
        //        messageQuery.whereKey("participants", containsAllObjectsInArray: [user.objectId, PFUser.currentUser().objectId])
        //
        //        messageQuery.findObjectsInBackgroundWithBlock { (messages, error) -> Void in
        //
        //            if messages.count > 0 {
        //
        //                self.messages = messages as [PFObject]
        //
        //            }
        //
        //        }
        
        nameLabel.text = newCell
        println(nameLabel.text)
        
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        let selectedImageIndex = Int(arc4random_uniform(1))
        
        // blurring effect
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        
    }
    
    func savingEvent() {
        
        var createEvent = PFObject(className:"Event")
        
        // add currentUser
        // add targetUser
        // accepted = undefined
        // declined = undefined
        // canceled = undefined
        
        
        createEvent["name"] = nameLabel.text
        createEvent["date"] = datePicker.date
        createEvent["setLocation"] = locLabel.text
        createEvent["senderId"] = PFUser.currentUser().objectId
        createEvent["receiverId"] = user.objectId
        createEvent["participants"] = [PFUser.currentUser().objectId,user.objectId]
        
        createEvent.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                
                //Saved
            } else {
                
                
            }
        }
    }
    
    
    
    //        var message = PFObject(className: "Messages")
    //
    //        message["content"] = "Someone has invited you to play tennis"
    //
    //        message.saveInBackgroundWithBlock(nil)
    //
    //        messages.append(message)
    
    //        tableView.reloadData()
    
    
    //    func pushMessage() {
    //
    //        var deviceQuery = PFInstallation.query()
    //
    //        deviceQuery.whereKey("userId", equalTo: user.objectId)
    //
    //        var push = PFPush()
    //        push.setMessage("Someone has invited you to play tennis")
    //        push.setQuery(deviceQuery)
    //        push.sendPush(nil)
    //
    //    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if venueLocation == nil {
            locLabel.text = "Choose Location-->"
        }else{
            
            locLabel.text = venueLocation
            println(locLabel.text)
        }
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
