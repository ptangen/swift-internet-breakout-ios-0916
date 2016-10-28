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
    var store = DataStore.sharedInstance
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        
        ForecastApiClient.getCurrentWeather(latitude: String(self.latitude), longitude: String(self.longitude)) { (forecast) in
            print(forecast.summary)
        }
   
        
    }

    
    


}






extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
        store.latitude =  String((locationManager.location?.coordinate.latitude)!)
        store.longitude = String((locationManager.location?.coordinate.longitude)!)
        
        
        
        
        
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

