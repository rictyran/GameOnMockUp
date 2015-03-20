//
//  RegistrationVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/3/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let pickerView = UIPickerView(frame: CGRectMake(0, 0, 320, 300))
        //        view.addSubview(pickerView)
        //        pickerView.delegate = self
        //        pickerView.dataSource = self
        
    }
    
    var chosenSkillLevel = ""
    var chosenAgeRange = ""
    var chosenGender = ""
    
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var zipCodeField: UITextField!
//    @IBOutlet var genderField: UITextField!
    
    @IBOutlet var genderController: UISegmentedControl!
    
    @IBAction func createAccount(sender: AnyObject) {
        
        println(firstNameField.text)
        println(lastNameField.text)
        println(emailField.text)
        println(passwordField.text)
        println(confirmPasswordField.text)
        println(zipCodeField.text)
        
//        println(genderField.text)
        
        var fieldValues: [String] = [firstNameField.text,lastNameField.text,emailField.text,passwordField.text,confirmPasswordField.text,zipCodeField.text]
        
        if find(fieldValues, "") != nil {
            
            var alertViewController = UIAlertController (title:"Try again.", message: "All fields need to be filled in.", preferredStyle: UIAlertControllerStyle.Alert)
            
            var defaultAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            
            alertViewController.addAction(defaultAction)
            
            presentViewController(alertViewController, animated: true, completion: nil)
            
        } else if (passwordField.text != confirmPasswordField.text) {
            
            var alertViewController = UIAlertController (title:"Try again.", message: "Password fields do not match.", preferredStyle: UIAlertControllerStyle.Alert)
            
            var defaultAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            
            alertViewController.addAction(defaultAction)
            
            presentViewController(alertViewController, animated: true, completion: nil)
            
        } else {
            
            println("all fields are good and login")
            
            var userQuery = PFUser.query()
            
            userQuery.whereKey("email", equalTo: emailField.text)
            
            userQuery.findObjectsInBackgroundWithBlock{(objects, error) -> Void in
                
                if objects.count > 0 {
                    
                    println(objects)
                    
                } else {
                    
                    println("signUp called")
                    self.signUp()
                    
                    
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let PVC = self.storyboard?.instantiateViewControllerWithIdentifier("PreferencesVC") as PreferencesVC
                
                self.presentViewController(PVC, animated: true, completion: nil)                
            }
        }
    }
    
    func signUp() {
        
        println("signUp")
        
        var user = PFUser()
        
        user.password = passwordField.text
        user.email = emailField.text
        user.username = emailField.text
        user["firstName"] = firstNameField.text
        user["lastName"] = lastNameField.text
        user["zipCode"] = zipCodeField.text
//        user["gender"] = genderField.text
        user["skillLevel"] = chosenSkillLevel
        user["ageRange"] = chosenAgeRange
        user["skillLevel"] = chosenSkillLevel
        user["gender"] = chosenGender
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            
            if error == nil {
                
                var user = PFUser.currentUser()
                
                
                var geoCoder = CLGeocoder()
                
                geoCoder.geocodeAddressString(self.zipCodeField.text, completionHandler: { (placemarks, error) -> Void in
                    
                    if let placemark = placemarks.first as? CLPlacemark {
                        
                        user["location"] = PFGeoPoint(location: placemark.location)
                        
                        user.saveInBackgroundWithBlock(nil)
                        
                    }
                    
                    
                })
                
                
                println("saved success")
                
                
                self.firstNameField.text = ""
                self.lastNameField.text = ""
                self.emailField.text = ""
                self.passwordField.text = ""
                self.confirmPasswordField.text = ""
                self.zipCodeField.text = ""
//                self.genderField.text = ""
                
                // Hooray! Let them use the app now.
                
            } else {
                
                let errorString = error.userInfo?["error"] as NSString
                println(errorString)
                // Show the errorString somewhere and let the user try again.
            }
        }
    }
    
    var skillLevel = ["Beginner","Intermediate","Advanced","USTA_1.5","USTA_2.0","USTA_2.5","USTA_3.0","USTA_3.5","USTA_4.0","USTA_4.5","USTA_5.0","USTA_5.5","USTA_6.0-7.0","ALTA_C","ALTA_B","ALTA_A","ALTA_AA"]
    
    var ageRange = ["18-29","30-39","40-49","50-59","60-69","70-79","80+"]
    
    //    var gender = ["female","male"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 2
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if component == 0 {
            
            return skillLevel.count
            
        }
        
        return ageRange.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        
        if component == 0 {
            
            return skillLevel[row]
            
        } else if component == 1 {
            
            if row < ageRange.count {
                return ageRange[row]
            }
            
        }
        
        //        if row < gender.count {
        //            return gender[row]
        //        }
        
        return ""
        
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        
        if component == 0 {
            
            chosenSkillLevel = skillLevel[row]
            NSLog("Skill level chosen %@",skillLevel[row])
            
            
        } else if component == 1 {
            
            chosenAgeRange = ageRange[row]
            NSLog("Age range chosen %@",ageRange[row])
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func selectGender(sender: AnyObject) {
        
        if genderController.selectedSegmentIndex == 0 {
            
            chosenGender = "male"
            
            println(chosenGender)
        }
        
            chosenGender = "female"
        
            println(chosenGender)
        
        
    }
}

//            userQuery.whereKey("firstName", equalTo: firstNameField.text)
//            userQuery.whereKey("lastName", equalTo: lastNameField.text)
//            userQuery.whereKey("password", equalTo: passwordField.text)
//            userQuery.whereKey("confirmPassword", equalTo: confirmPasswordField.text)
//            userQuery.whereKey("zipCode", equalTo: zipCodeField.text)
//            userQuery.whereKey("age", equalTo: ageField.text)
//            userQuery.whereKey("gender", equalTo: genderField.text)



//            NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//
//                if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
//
//                    self.buttonBottomConstraint.constant = 20 + kbSize.height
//
//                    self.view.layoutIfNeeded()
//
//                }
//
//            }
//
//            self.view.frame.origin.y = -kbSize.height
//
//            NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//
//                self.buttonBottomConstraint.constant = 20
//
//                self.view.layoutIfNeeded()
//            }

//all fields are filled in!

