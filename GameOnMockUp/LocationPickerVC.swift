//
//  LocationPickerVC.swift
//  GameOnMockUp
//
//  Created by Richard Tyran on 3/3/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var onceToken:dispatch_once_t = 0


class MyPointAnnotation: MKPointAnnotation {
    
    var index: Int = 0
    
    
    
    
    
}

class LocationPickerVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    var lManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mapView.delegate = self
        
        mapView.frame = view.frame
        
        view.addSubview(mapView)
        
        lManager.requestWhenInUseAuthorization()
        
        
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        
        lManager.distanceFilter = kCLDistanceFilterNone
        
        lManager.startUpdatingLocation()
        
        
     
        
    }
    
    func refreshFeed() {
        
        
        FeedData.mainData().refreshFeedItems { () -> () in
            
            
            self.createAnnotationsWithCourts(FeedData.mainData().feedItems)
            
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshFeed()
        
    }
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        
//        mapView.showsUserLocation = true
//        
//        
//        
//        dispatch_once(&onceToken) { () -> Void in
//            
//            println(locations.last)
//            
//            if let location = locations.last as? CLLocation {
//                
//                self.mapView.centerCoordinate = location.coordinate
//                
//                let span = MKCoordinateSpanMake(0.1, 0.1)
//                
//                let region = MKCoordinateRegion(center: location.coordinate, span: span)
//                
//                self.mapView.setRegion(region, animated: true)
//                
//                
//                              var annotationArray = self.mapView.annotations
//                self.mapView.showAnnotations(annotationArray, animated: true)
//                
//                
//                
//                
//                
//            }
//            
//        }
//        
//        lManager.stopUpdatingLocation()
//        
//    }
//    
//    
//    func createAnnotationsWithVenues(venues: [AnyObject]) {
//        
//        for venue in venues as [[String:AnyObject]] {
//            
//            
//            let locationInfo = venue["location"] as [String:AnyObject]
//            
//            let lat = locationInfo["lat"] as CLLocationDegrees
//            let lng = locationInfo["lng"] as CLLocationDegrees
//            
//            let coordinate = CLLocationCoordinate2DMake(lat,lng)
//            
//            let annotation = MKPointAnnotation()
//            
//            annotation.setCoordinate(coordinate)
//            
//            mapView.addAnnotation(annotation)
//        }
//        
//    }
//    
//
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
//        
//        
//        if annotation is MKUserLocation {
//            //return nil so map view draws "blue dot" for standard user location
//            return nil
//        }
//        
//        let reuseId = "pin"
//        
//        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            pinView!.canShowCallout = true
//            pinView!.animatesDrop = true
//            pinView!.pinColor = .Purple
//        }
//        else {
//            pinView!.annotation = annotation
//        }
//        
//        return pinView
//    }
//    
//    
//}
    // MAKE ANNOTATIONS FOR FEED ITEMS
    
    func createAnnotationsWithCourts(courts: [PFObject]) {
        
        for (i,courts) in enumerate(courts) {
            
            let venue = courts["venue"] as [String:AnyObject]
            
            let locationName = venue["name"] as String
            
            
            
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let lat = locationInfo["lat"] as CLLocationDegrees
            let lng = locationInfo["lng"] as CLLocationDegrees
            
            let coordinate = CLLocationCoordinate2DMake(lat,lng)
            
            let annotation = MyPointAnnotation()
            
            annotation.index = i
            
            annotation.setCoordinate(coordinate)
            
            mapView.addAnnotation(annotation)
            
            
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
            var information = MKPointAnnotation()
            information.coordinate = location
            information.title = courts["name"] as String
            information.subtitle = "subtitle"
            
            
            
            mapView.addAnnotation(information)
            
            
           
        }
        
        
    }
    
    func buttonClicked (sender : ArrowButton!) {
        println("Button Clicked")
        
        self.performSegueWithIdentifier("MatchProfile", sender: ArrowButton())
        
    }
    
  
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        

        
        var annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnn")
        
        var rightArrowButton = ArrowButton(frame: CGRectMake(0, 0, 22, 22))
        
        rightArrowButton.strokeSize = 2
        rightArrowButton.leftInset = 8
        rightArrowButton.rightInset = 8
        rightArrowButton.topInset = 5
        rightArrowButton.bottomInset = 5
        
        
        annotationView.rightCalloutAccessoryView = rightArrowButton
        
        
        annotationView.canShowCallout = true
        
        
        
        rightArrowButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
     
        
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            annotationView.pinColor = .Purple
        }
        
        
        
        return annotationView
        
        
        
    }
    
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
      //  let index = (view.annotation as MyPointAnnotation).index
        
      //  FeedData.mainData().selectedSeat = FeedData.mainData().feedItems[index]
        
        
        var detailVC = storyboard?.instantiateViewControllerWithIdentifier("MatchProfile") as MatchProfileTVC
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        mapView.showsUserLocation = true
        
        
        
        dispatch_once(&onceToken) { () -> Void in
            
            println(locations.last)
            
            if let location = locations.last as? CLLocation {
                
                self.mapView.centerCoordinate = location.coordinate
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
                
                  var foursquareData = FourSquareRequest.requestVenuesWithLocation(location)
                
                
                //
                //                let venues = CLLocationManagerDelegate.conformsToProtocol(self)
                //
                //
                //                println(venues)
                //
                // self.createAnnotationsWithVenues(venues)
                
                //request to foursquare for venues with location
                
                var annotationArray = self.mapView.annotations
                self.mapView.showAnnotations(annotationArray, animated: true)
                
                
                let venues = FourSquareRequest.requestVenuesWithLocation(location)
                
                
                for venue in venues {
                    
                    
                    let venueName = venue["name"] as? String
                    
                    let locationInfo = venue["location"] as [String:AnyObject]
                    
                    let lat = locationInfo["lat"] as CLLocationDegrees
                    let lng = locationInfo["lng"] as CLLocationDegrees
                    
                    let coordinate = CLLocationCoordinate2DMake(lat,lng)
                    
                    let annotation = MKPointAnnotation()
        
                    annotation.setCoordinate(coordinate)
                    
                    
                    if let venueName = venueName { annotation.title = venueName }
        
                    self.mapView.addAnnotation(annotation)
                    
                    
                    
                    
                    //PARSE
                    
                    
//                    let geoPoint = PFGeoPoint(latitude: lat, longitude: lng)
//                    
//                    let userLocation = PFObject(className: "UserLocation")
//                    
//                    userLocation["location"] = geoPoint
//                    
//                    userLocation.saveInBackgroundWithBlock(nil)
//                    
//                    let geoPoint1 = userLocation["location"] as PFGeoPoint
//                    
//                    let location = CLLocation(latitude: geoPoint1.latitude, longitude: geoPoint1.longitude)
                    
                    
                }
                
                
            }
            
        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}//END

