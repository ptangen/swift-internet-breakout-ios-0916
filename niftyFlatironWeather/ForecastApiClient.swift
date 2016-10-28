//
//  ForecastApiClient.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class ForecastApiClient{
    
    
    
    class func getWeatherForecast(for period:ForecastType, latitude:String, longitude:String, completion:@escaping ([Forecast]) -> ()){
        var forecasts = [Forecast]()
        getWeather(latitude: latitude, longitude: longitude) { (forecastDict) in
            let periodString = "\(period)"
            print(periodString)
            
            let periodDict = forecastDict[periodString] as! [String:Any]
            let dataArray = periodDict["data"] as! [[String:Any]]
            
            for dataItem in dataArray {
                var forecast = Forecast(dict: dataItem)
                forecasts.append(forecast)
            }
            completion(forecasts)
        }
        
        
    }
    
    
    class func getCurrentWeather(latitude:String, longitude:String, completion:@escaping (Forecast)->()){
        getWeather(latitude: latitude, longitude: longitude) { (forecastDict) in
            
            let data = forecastDict["currently"] as! [String:Any]
            var forecast = Forecast(dict: data)
            completion(forecast)
            
        }

        
        
        
        
    }
    
    
    
    private class func getWeather(latitude:String,longitude:String,completion:@escaping ([String:Any])->()){
        let urlString = "\(Secrets.apiUrl)\(Secrets.apiKey)/\(latitude),\(longitude)"
        
        let url = URL(string: urlString)

        
        guard let unwrappedUrl = url else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            guard let unwrappeddata = data else { return }
            do {
               var responseJson = try JSONSerialization.jsonObject(with: unwrappeddata, options: []) as! [String:Any]
                completion(responseJson)
                
            }catch{
                
            }
            
            
            
            
          
        }
        task.resume()
    }
    
    
}
