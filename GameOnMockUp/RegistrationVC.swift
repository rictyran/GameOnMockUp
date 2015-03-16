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
        
    }
    
    var chosenSkillLevel = ""
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var zipCodeField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var genderField: UITextField!
    
    @IBAction func createAccount(sender: AnyObject) {
        
        
        println(firstNameField.text)
        println(lastNameField.text)
        println(emailField.text)
        println(passwordField.text)
        println(confirmPasswordField.text)
        println(zipCodeField.text)
        println(ageField.text)
        println(genderField.text)
        
        var fieldValues: [String] = [firstNameField.text,lastNameField.text,emailField.text,passwordField.text,confirmPasswordField.text,zipCodeField.text,ageField.text,genderField.text]
        
        if find(fieldValues, "") != nil {
            
            //all fields are not filled in!
            
            var alertViewController = UIAlertController (title:"No bueno!!", message: "All fields need to be filled in.", preferredStyle: UIAlertControllerStyle.Alert)
            
            var defaultAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
            
            alertViewController.addAction(defaultAction)
            
            presentViewController(alertViewController, animated: true, completion: nil)
            
        } else {
            
            //all fields are filled in!
            
            println("all fields are good and login")
            
            var userQuery = PFUser.query()
            
            userQuery.whereKey("email", equalTo: emailField.text)
//            userQuery.whereKey("firstName", equalTo: firstNameField.text)
//            userQuery.whereKey("lastName", equalTo: lastNameField.text)
//            userQuery.whereKey("password", equalTo: passwordField.text)
//            userQuery.whereKey("confirmPassword", equalTo: confirmPasswordField.text)
//            userQuery.whereKey("zipCode", equalTo: zipCodeField.text)
//            userQuery.whereKey("age", equalTo: ageField.text)
//            userQuery.whereKey("gender", equalTo: genderField.text)
//            


        
            userQuery.findObjectsInBackgroundWithBlock{(objects, error) -> Void in
                
                if objects.count > 0 {
                    
                    println(objects)
                
                } else {
                    
                    println("signUp called")
                    self.signUp()
                    
                }
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
//        user["age"] = ageField.text
        user["gender"] = genderField.text
        user["skillLevel"] = chosenSkillLevel
       
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            
            if error == nil {
                

                var PVC = self.storyboard?.instantiateViewControllerWithIdentifier("PreferencesVC") as? UIViewController
                
                UIApplication.sharedApplication().keyWindow?.rootViewController = PVC

//                user["user"] = user
//                user.saveInBackgroundWithBlock({ (succeeded: Bool!, error: NSError!) -> Void in
//                    
//                })
                
                self.firstNameField.text = ""
                self.lastNameField.text = ""
                self.emailField.text = ""
                self.passwordField.text = ""
                self.confirmPasswordField.text = ""
                self.zipCodeField.text = ""
                self.ageField.text = ""
                self.genderField.text = ""
                
                
                
                
             
               
                
                // Hooray! Let them use the app now.
                
            } else {
                
                let errorString = error.userInfo?["error"] as NSString
                println(errorString)
                // Show the errorString somewhere and let the user try again.
            }
        }
    }
    
        
//                NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//
//                    if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
//        
//                        self.buttonBottomConstraint.constant = 20 + kbSize.height
//        
//                        self.view.layoutIfNeeded()
//        
//                    }
//        
//                }
//        
//                // self.view.frame.origin.y = -kbSize.height
//        
//                NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
//        
//                    self.buttonBottomConstraint.constant = 20
//        
//                    self.view.layoutIfNeeded()
//        
//        
//        
//                }
//        
//        
//        
//        
//        
    
    
    var skillLevel = ["Beginner","Intermediate","Advanced","USTA_1.5","USTA_2.0","USTA_2.5","USTA_3.0","USTA_3.5","USTA_4.0","USTA_4.5","USTA_5.0","USTA_5.5","USTA_6.0-7.0","ALTA_C","ALTA_B","ALTA_A","ALTA_AA"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return skillLevel.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        
        return skillLevel[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    
    {
        chosenSkillLevel = skillLevel[row]
        
        NSLog("Skill level chosen %@",skillLevel[row])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}