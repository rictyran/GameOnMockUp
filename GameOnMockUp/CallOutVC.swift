//
//  CallOutVC.swift
//  GameOnMockUp
//
//  Created by Jeanie House on 3/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class CallOutVC: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    

    
    let url = NSURL(string: "http://www.google.com/maps")
    let request = NSURLRequest(URL:url!)
        webView.loadRequest(request)
  
    
 

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
