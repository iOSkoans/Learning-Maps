//
//  ViewController.swift
//  Learning Map
//
//  Created by Calvin Cheng on 2/3/15.
//  Copyright (c) 2015 Hello HQ Pte Ltd. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.430077, 103.786016
        var latitude: CLLocationDegrees = 1.430077
        var longitude: CLLocationDegrees = 103.786016
        
        // zoom level definitions
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        // span of the map and center it on the location
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Our home"
        annotation.subtitle = "My favorite place..."
        mapView.addAnnotation(annotation)
        
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(longPress)
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoordinate
        newAnnotation.title = "Here"
        newAnnotation.subtitle = "new annotation"
        mapView.addAnnotation(newAnnotation)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

