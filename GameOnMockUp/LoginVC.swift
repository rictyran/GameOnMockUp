//
//  LoginVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 2/26/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    func login() {
        
        var user = PFUser()
        
        user.password = passwordField.text
        user.email = emailField.text
        
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            
            if user != nil {
        
                // segue to FutureVC
                
                println("logged in as \(user)")

            } else {
                
                // do nothing, user should type in email and password or choose to create an account
                
            }
        }
    }
    
    
    var currentUser = PFUser.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    @IBAction func loginButton(sender: AnyObject) {
    
        var fieldsArray: [String] = [emailField.text,passwordField.text]
        
        if find(fieldsArray, "") != nil {
            
            var alertViewController = UIAlertController(title: "Submission Error", message: "All fields need to be filled", preferredStyle: UIAlertControllerStyle.Alert)
            
            var defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            
            alertViewController.addAction(defaultAction)
            
        } else {
            
            var userQuery = PFUser.query()
            
            userQuery.whereKey("email", equalTo: emailField.text)
            
            userQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if objects.count > 0 {
                    
                    self.login()
                    
                } else {
                    
                    var alertViewController = UIAlertController(title: "Submission Error", message: "All fields need to be filled", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    var defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    
                    alertViewController.addAction(defaultAction)

                }
            })
        }
    }
}


    





