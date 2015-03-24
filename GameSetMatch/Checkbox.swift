//
//  Checkbox.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/17/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class Checkbox: UIButton {
    
    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let uncheckedImage = UIImage(named: "unchecked_checkbox")
    
    //bool property
    var isChecked:Bool = false{
        didSet {
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
}
