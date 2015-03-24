//
//  FourSquareRequest.swift
//  GameOn
//
//  Created by Jeanie House on 3/10/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit
import CoreLocation

let API_URL = "https://api.foursquare.com/v2/venues/search?"

let CLIENT_ID = "ZHUZLUCHJI0RNW2BGKGAYB0F4K5PAH4Q4WWU3SUJ4WIETNEL"

let CLIENT_SECRET = "T0UDWA2IIA35AVAVYZESMBWHTOIIT2QGOY0YVK2OCL2UPT1K"

let TENNIS_CATEGORY = "4e39a891bd410d7aed40cbc2"

let TENNIS_QUERY = "Tennis%20Court"



class FourSquareRequest: NSObject {
    
    class func requestVenuesWithLocation(location: CLLocation) -> [AnyObject] {
        
        //categories, tenniscourts
        let requestString = "\(API_URL)client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20130815&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&query=\(TENNIS_QUERY)"
        
        println(requestString)
        
        
        if  let url = NSURL(string: requestString) {
            
             let request = NSURLRequest(URL: url)
            
            
            
            if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil) {
                
                if let returnInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    if let responseInfo = returnInfo["response"] as? [String:AnyObject]{
                     println(responseInfo)
                    
                    
                    return responseInfo["venues"] as [AnyObject]
                    }
                    
                }
                
                
                
            }
            
            
            
        }
        
    
        
        return []
        
    }
    
    
    
    
   
}





