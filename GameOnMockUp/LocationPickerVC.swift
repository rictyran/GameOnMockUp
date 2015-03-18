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
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBAction func backButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    var lManager = CLLocationManager()
    
     private var imageSet = ["Courts", "Court"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let selectedImageIndex = Int(arc4random_uniform(1))
        
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        mapView.delegate = self
        
        mapView.frame = view.frame
        
        view.addSubview(mapView)
        
        lManager.requestWhenInUseAuthorization()
        
        
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        
        lManager.distanceFilter = kCLDistanceFilterNone
        
        lManager.startUpdatingLocation()
        
        
     
        
    }
    
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

        
    }
    
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
        
        
        /////
        rightArrowButton.coordinate = annotation.coordinate
        
      
        
        rightArrowButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
       
    
        
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            annotationView.pinColor = .Purple
        }
        
        
        
        return annotationView
        
        
        
    }
    
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
    
        view.annotation.title
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
            
                    
                    
       
                }
                
                
            }
            
        }
    }
    
    func buttonClicked (sender : ArrowButton!) {
        println("Button Clicked")

        let myCurrentMapItem = MKMapItem.mapItemForCurrentLocation()
        
        let destPlacemark = MKPlacemark(coordinate: sender.coordinate!, addressDictionary: nil)
        let destMapItem = MKMapItem(placemark: destPlacemark)
        
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        
        MKMapItem.openMapsWithItems([myCurrentMapItem,destMapItem], launchOptions: options)

        
    }
    
    

    }//end
    

    

    


