//
//  PreferencesVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/10/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class PreferencesVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    var chosenSkillLevel = ""
    var chosenAgeRange = ""
    var chosenGender = ""

    var skillLevel = ["Beginner","Intermediate","Advanced","USTA_1.5","USTA_2.0","USTA_2.5","USTA_3.0","USTA_3.5","USTA_4.0","USTA_4.5","USTA_5.0","USTA_5.5","USTA_6.0-7.0","ALTA_C","ALTA_B","ALTA_A","ALTA_AA"]
    
    var ageRange = ["18-29","30-39","40-49","50-59","60-69","70-79","80+"]
    
    var gender = ["female","male","either"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 2
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if component == 0 {
            
            return skillLevel.count
        
        } else if component == 1 {
            
            return ageRange.count
        }
        
            return gender.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        
        if component == 0 {
            
            return skillLevel[row]
            
        } else if component == 1 {
            
            if row < ageRange.count {
                return ageRange[row]
            }
            
        }
        
        if row < gender.count {
            return gender[row]
        }
        
        return ""
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        if component == 0 {
            
            chosenSkillLevel = skillLevel[row]
            NSLog("Skill level chosen %@",skillLevel[row])
            
            
        } else if component == 1 {
            
            chosenAgeRange = ageRange[row]
            NSLog("Age range chosen %@",ageRange[row])
            
        } else {
            chosenGender = gender[row]
            NSLog("Gender chosen %@",gender[row])
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
