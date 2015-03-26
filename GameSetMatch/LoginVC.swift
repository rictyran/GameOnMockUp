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
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    
    

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        checkIfLoggedIn()
        
        
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            var kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size
            
            self.buttonBottomConstraint.constant = 20 + kbSize!.height
            
            // self.view.frame.origin.y = -kbSize.height
            
            self.view.layoutIfNeeded()
            
        }
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            
            self.buttonBottomConstraint.constant = 20
            
            
            self.view.layoutIfNeeded()
            
        }
        
        
        
        println(isLoggedIn)
        
    }
    
    func login() {
        //
        //        var user = PFUser()
        //
        //        user.password = passwordField.text
        //        user.email = emailField.text
        //        user.username = emailField.text
        //
        
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            
            if user != nil {
                
                println("logged in as \(user)")
                
                self.isLoggedIn = true
                self.checkIfLoggedIn()
                
            } else {
                
                var alertViewController = UIAlertController(title: "Submission Error", message: "No Email Found", preferredStyle: UIAlertControllerStyle.Alert)
                
                var defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                
                alertViewController.addAction(defaultAction)
                
                
                // alert saying login failed
                
                // do nothing, user should type in email and password or choose to create an account
                
                println("cant log in with \(self.emailField.text) and \(self.passwordField.text)")
            }
        }
        
        
        var currentUser = PFUser.currentUser()
        
        
        if currentUser != nil {
            // Do stuff with the user
        } else {
            // Show the signup or login screen
        }
    }
    
    
        
    @IBAction func loginButton(sender: AnyObject) {
        
        
      
    
        
        var fieldsArray: [String] = [emailField.text,passwordField.text]
        
        if find(fieldsArray, "") != nil {
            
            var alertViewController = UIAlertController(title: "Submission Error", message: "All fields need to be filled", preferredStyle: UIAlertControllerStyle.Alert)
            
            var defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            
            alertViewController.addAction(defaultAction)
            
            presentViewController(alertViewController, animated: true, completion: nil)
            
        } else {
            
            var userQuery = PFUser.query()
            
            userQuery.whereKey("email", equalTo: emailField.text)
            
            userQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if objects.count > 0 {
                    
                    self.login()
                    
                } else {
                    
                    var alertViewController = UIAlertController(title: "Submission Error", message: "No Email Found", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    var defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    
                    alertViewController.addAction(defaultAction)
                    
                }
            })
        }
    }
    
    var isLoggedIn: Bool {
        
        get {
            
            return NSUserDefaults.standardUserDefaults().boolForKey("isLoggedIn")
            
        }
        
        set {
            
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: "isLoggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
    }
    
    func checkIfLoggedIn() {
        
        println(isLoggedIn)
        
        if isLoggedIn {
            
            var mapSB = UIStoryboard(name: "Map", bundle: nil)
            var PETVC = mapSB.instantiateInitialViewController() as UINavigationController
            
            presentViewController(PETVC, animated: true, completion: nil)
            
        } else {
            
            //            login()
            //
        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}








