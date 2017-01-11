//
//  CurrentWeather.swift
//  weather
//
//  Created by Damian Ortiz on 1/9/17.
//  Copyright © 2017 Domino. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _icon: String!
    
    var cityName: String {
        
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        
        if _currentTemp == nil {
            _currentTemp = 10
        }
        return _currentTemp
    }
    
    var icon: String {
        if _icon == nil {
            _icon = "N/A"
        }
        return _icon
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        //AlamoFire Download
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let currently = dict["currently"] as? Dictionary<String, AnyObject> {
                    
                    if let summary = currently["summary"] as? String {
                        self._weatherType = summary.capitalized
                    }
                    
                    if let currentTemperature = currently["temperature"] as? Double {
                        self._currentTemp = Double(round(currentTemperature*100)/100)
                    }
                    
                    if let weatherIcon = currently["icon"] as? String {
                        self._icon = weatherIcon
                        print(self._icon)
                    }
                }
                completed()
            }
        }
    }
    
    func getPlacemark(forLocation location: CLLocation, completionHandler: @escaping (CLPlacemark?, String?) -> ()) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {
            placemarks, error in
            
            if let err = error {
                completionHandler(nil, err.localizedDescription)
            } else if let placemarkArray = placemarks {
                if let placemark = placemarkArray.first {
                    completionHandler(placemark, nil)
                } else {
                    completionHandler(nil, "Placemark was nil")
                }
            } else {
                completionHandler(nil, "Unknown error")
            }
        })
        
    }
    
}
