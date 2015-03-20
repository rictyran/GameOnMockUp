//
//  SchedulerVCViewController.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/19/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class SchedulerVCViewController: UIViewController {
    
    var playerTable = PlayerTableViewController()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locTextField: UITextField!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
  
 //   @IBOutlet weak var bottomTextConstraint: NSLayoutConstraint!
    
    
  
    @IBAction func sendMessage(sender: AnyObject) {
        
        
       savingEvent()
        
        
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
        
        
        
        
        
//        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//            
//            var kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size
//            
//            self.bottomTextConstraint.constant = 20 + kbSize!.height
//           
//            
//            self.view.layoutIfNeeded()
//            
//        }
        
        
//        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//            
//            
//            self.bottomTextConstraint.constant = 20
//            
//            
//            self.view.layoutIfNeeded()
//            
//        }
    
     
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
