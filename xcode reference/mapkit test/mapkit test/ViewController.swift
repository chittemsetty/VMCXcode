//
//  ViewController.swift
//  mapkit test
//
//  Created by Venu Chittemsetty on 8/20/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
        }
        else {
            manager.requestWhenInUseAuthorization()
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, <#T##latitudinalMeters: CLLocationDistance##CLLocationDistance#>, <#T##longitudinalMeters: CLLocationDistance##CLLocationDistance#>)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

