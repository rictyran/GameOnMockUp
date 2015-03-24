//
//  PreferencesVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/10/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PreferencesVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet var weekdayController: UISegmentedControl!
    
    @IBOutlet var saturdayController: UISegmentedControl!
    
    @IBOutlet var sundayController: UISegmentedControl!
    
    @IBOutlet var genderController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var chosenSkillLevel = ""
    var chosenAgeRange = ""
    var chosenGender = "Either"
    var chosenWeekday = "None"
    var chosenSaturday = "None"
    var chosenSunday = "None"

    func setPreferences() {
        
        var user = PFUser.currentUser()
        
        println("\(chosenWeekday), \(chosenSaturday), \(chosenSunday), \(chosenGender), \(chosenAgeRange),\(chosenSkillLevel) ")
        
        
        user["weekdayTime"] = chosenWeekday
        user["saturdayTime"] = chosenSaturday
        user["sundayTime"] = chosenSunday
        user["opponentGender"] = chosenGender
        user["opponentAgeRange"] = chosenAgeRange
        user["opponentSkillLevel"] = chosenSkillLevel
        
        user.saveInBackgroundWithBlock { (succeeded: Bool!, error: NSError!) -> Void in
        
            if error == nil {
                
                var user = PFUser.currentUser()
                
                user.save()
                
                let currentInstallation = PFInstallation.currentInstallation()
                currentInstallation["userId"] = PFUser.currentUser().objectId
                currentInstallation.saveInBackgroundWithBlock(nil)

                
                println("saved success")
                
//                var PTVC = Map.storyboard?.instantiateViewControllerWithIdentifier("PlayerTableViewController") as? UITableViewController
                
//                UIApplication.sharedApplication().keyWindow?.rootViewController = PVC

            }
            
        }
        
    }
    
    @IBAction func savePreferencesButton(sender: AnyObject) {
    
        setPreferences()
        
//        var mapStoryboard = UIStoryboard(name: "Map", bundle: nil)
//        let PTVC = mapStoryboard.instantiateViewControllerWithIdentifier("PlayerTVC") as PlayerTableViewController
//        
//        self.presentViewController(PTVC, animated: true, completion: nil)
        
        var mapSB = UIStoryboard(name: "Map", bundle: nil)
        var PTVC = mapSB.instantiateInitialViewController() as UINavigationController
        
        presentViewController(PTVC, animated: true, completion: nil)

        
    }
    
    var skillLevel = ["","Beginner","Intermediate","Advanced","USTA_1.5","USTA_2.0","USTA_2.5","USTA_3.0","USTA_3.5","USTA_4.0","USTA_4.5","USTA_5.0","USTA_5.5","USTA_6.0-7.0","ALTA_C","ALTA_B","ALTA_A","ALTA_AA"]
    
    var ageRange = ["","18-29","30-39","40-49","50-59","60-69","70-79","80+"]

    
    @IBAction func weekdayChosen(sender: AnyObject) {
        
        if weekdayController.selectedSegmentIndex == 0 {
            
            chosenWeekday = "None"
            
        } else if weekdayController.selectedSegmentIndex == 1 {
            
            chosenWeekday = "Morning"
        
        } else if weekdayController.selectedSegmentIndex == 2 {
            
            chosenWeekday = "Afternoon"
        
        } else {
        
            chosenWeekday = "Evening"
        
    }
        
          println(chosenWeekday)
        
    }
    
    @IBAction func saturdayChosen(sender: AnyObject) {
    
        if saturdayController.selectedSegmentIndex == 0 {
            
            chosenSaturday = "None"
            
        } else if saturdayController.selectedSegmentIndex == 1 {
            
            chosenSaturday = "Morning"
            
        } else if saturdayController.selectedSegmentIndex == 2 {
            
            chosenSaturday = "Afternoon"
        
        } else {
            
            chosenSaturday = "Evening"
        }
        
        println(chosenSaturday)
            
        }
    
    
    @IBAction func sundayChosen(sender: AnyObject) {
        
        if sundayController.selectedSegmentIndex == 0 {
            
            chosenSunday = "None"
            
        } else if sundayController.selectedSegmentIndex == 1 {
            
            chosenSunday = "Morning"
            
        } else if sundayController.selectedSegmentIndex == 2 {
            
            chosenSunday = "Afternoon"
        
        } else {
        
        chosenSunday = "Evening"
        
        }
        
        println(chosenSunday)
        
    }
    
    @IBAction func genderChosen(sender: AnyObject) {
    
        if genderController.selectedSegmentIndex == 0 {
            
            chosenGender = "Either"
            
        } else if genderController.selectedSegmentIndex == 1 {
            
            chosenGender = "Female"
            
        } else {
            
            chosenGender = "Male"
        }
        
        println(chosenGender)

    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 2
        
    }
    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//        
//        var toReturn: Int = 0
//        
//        if component == 0 {
//            
//           toReturn = skillLevel.count
//        
//        } else if component == 1 {
//            
//            toReturn = ageRange.count
//        }
//         return toReturn
//
//    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if component == 0 {
            
            return skillLevel.count
            
        } else {
            
            return ageRange.count
            
        }
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
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    
}
