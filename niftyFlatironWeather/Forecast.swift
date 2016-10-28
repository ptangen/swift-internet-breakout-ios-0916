//
//  Forecast.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


enum ForecastType{
    case hourly, daily
}

struct Forecast{
    var time:Date!
    var timeString: String!
    var summary:String!
    var icon:String!
    var temp:Double!
    var humidity: Double!
    
    
    init(dict: [String:Any]){
        var timeInterval = dict["time"] as! Double
        self.time = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        self.timeString = dateFormatter.string(from: self.time)
        self.summary = dict["summary"] as! String
        self.icon = dict["icon"] as! String
        self.temp = dict["temperature"] as! Double
        self.humidity = dict["humidity"] as! Double
    }
}

//"time": 1477659600,
//"summary": "Light Rain",
//"icon": "rain",
//"precipIntensity": 0.0169,
//"precipProbability": 0.69,
//"precipType": "rain",
//"temperature": 60.27,
//"apparentTemperature": 60.27,
//"dewPoint": 59.03,
//"humidity": 0.96,
//"windSpeed": 1.21,
//"windBearing": 203,
//"visibility": 4.95,
//"cloudCover": 1,
//"pressure": 1011.11,
//"ozone": 273.21



