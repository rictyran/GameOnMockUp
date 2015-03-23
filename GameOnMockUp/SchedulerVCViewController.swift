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
   
    
    @IBOutlet weak var backgroundImageView: UIImageView!
  
 
    @IBOutlet weak var locLabel: UILabel!
    
    
    @IBAction func mapButton(sender: AnyObject) {
        
        
        var locVC = storyboard?.instantiateViewControllerWithIdentifier("LVC") as LocationPickerVC
        
        
        navigationController?.pushViewController(locVC, animated: true)
        
    }
  
    
    @IBAction func saveSendPush(sender: AnyObject) {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Notify Player", message: "", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let sendAction: UIAlertAction = UIAlertAction(title: "Send", style: .Default) { action -> Void in
            //Do some other stuff
            
            cellOne = self.nameLabel.text
            cellTwo = self.dateLabel.text
            cellThree = self.locLabel.text
            
            self.savingEvent()
            
            
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("pendingEventsTVC") as PendingEventsTVC
            
             self.navigationController?.pushViewController(vc, animated: true)

            
        }
        actionSheetController.addAction(sendAction)
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.textColor = UIColor.blueColor()
        }
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
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
    createEvent["setLocation"] = locLabel.text
        
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
