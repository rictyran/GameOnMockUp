//
//  SchedulerVCViewController.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/19/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

var cellOne: String!
var cellTwo: String!
var cellThree: String!

class SchedulerVCViewController: UIViewController, UIAlertViewDelegate {
    
    
    
    var playerTable = PlayerTableViewController()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locTextField: UITextField!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
  
 
    
    
  
 
    @IBAction func saveEvent(sender: AnyObject) {
    
        cellOne = nameLabel.text
        cellTwo = dateLabel.text
        cellThree = locTextField.text
        
        
       savingEvent()
        
        presentViewController(PendingEventsTVC(), animated: true, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func sendPush(sender: AnyObject) {
    
    
        var alert = UIAlertView(title: "Notify Player", message: "Send a message", delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "Send")
        
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        
        alert.show()
    }
    
    
   
    
    private var imageSet = ["image1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        


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
    createEvent["name"] = nameLabel.text
    createEvent["date"] = datePicker.date
    createEvent["setLocation"] = locTextField.text
        
    createEvent.saveInBackgroundWithBlock {
    (success: Bool, error: NSError!) -> Void in
    if (success) {
    
    //Saved
    } else {
    
   
    }
    }
    }
    
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

    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
