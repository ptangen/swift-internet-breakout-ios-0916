//
//  DataStore.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class DataStore{
    static let sharedInstance = DataStore()
    private init(){}
    
    var hourlyForecasts = [Forecast]()
    var dailyForecasts = [Forecast]()
    var currentForecast: Forecast!
    
    var latitude = ""
    var longitude = ""
    
    func getForecast(completion:@escaping ()->()){
        ForecastApiClient.getCurrentWeather(latitude: latitude, longitude: longitude) { (forecast) in
            self.currentForecast = forecast
            completion()
        }
    }
    func getForecast(for period:ForecastType, completion:@escaping ()->()){
        ForecastApiClient.getWeatherForecast(for: period, latitude: latitude, longitude: longitude) { (forecasts) in
            switch period{
            case .daily:
                self.dailyForecasts = forecasts
            case .hourly:
                self.dailyForecasts = forecasts
            }
            
            completion()
        }
        
    }
    
    
    
}
