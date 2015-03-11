//
//  RegistrationVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/3/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var zipCodeField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var genderField: UITextField!
    
    
    @IBAction func createAccount(sender: AnyObject) {
    
        
        func signUp() {
            
            var user = PFUser()
            
            user.password = passwordField.text
            user.email = emailField.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                
                if error == nil {
                    
                    println(user)
                    
                    self.passwordField.text = ""
                    self.emailField.text = ""
                    
                    // Hooray! Let them use the app now.
                    
                } else {
                    
                    let errorString = error.userInfo?["error"] as NSString
                    
                    // Show the errorString somewhere and let the user try again.
                }
            }
        }

    
    }
    var skillLevel = ["Beginner","Intermediate","Advanced","USTA 1.5","USTA 2.0","USTA 2.5","USTA 3.0","USTA 3.5","USTA 4.0","USTA 4.5","USTA 5.0","USTA 5.5","USTA 6.0-7.0","ALTA C","ALTA B","ALTA A","ALTA AA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
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
        
        NSLog("Skill level chosen %@",skillLevel[row]);
        
        
        
    }
    
}
