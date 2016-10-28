//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    
        
    }



}


extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

