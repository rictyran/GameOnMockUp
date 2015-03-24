//
//  FutureVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/3/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class FutureVC: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBAction func searchMapButton(sender: AnyObject) {
        
        var mapSB = UIStoryboard(name: "Map", bundle: nil)
        var locVC = mapSB.instantiateInitialViewController() as UINavigationController
        
        presentViewController(locVC, animated: true, completion: nil)
        
        
    }
    
    
     private var imageSet = ["Courts", "Court"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedImageIndex = Int(arc4random_uniform(1))
        
        //blurring effect
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
