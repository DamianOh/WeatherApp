//
//  Forecast.swift
//  weather
//
//  Created by Damian Ortiz on 1/10/17.
//  Copyright © 2017 Domino. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    var _description: String!
    
    var date: String {
        if _date == nil {
            _date = "January 1st 1999"
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "Cloudy"
        }
        return _weatherType
    }
    
    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 99.9
        }
        return _highTemp
    }
    
    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = -99.9
        }
        return _lowTemp
    }
    
    var description: String {
        if _description == nil {
            _description = "Unavailable"
        }
        return _description
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let lowTemperature = weatherDict["temperatureMin"] as? Double {
            self._lowTemp = Double(round(lowTemperature *  10)/10)
        }
        
        if let highTemperature = weatherDict["temperatureMax"] as? Double {
            self._highTemp = Double(round(highTemperature))
        }
        
        if let summary = weatherDict["summary"] as? String {
            self._description = summary
        }
        
        if let icon = weatherDict["icon"] as? String {
            self._weatherType = icon
        }
        
        if let theDate = weatherDict["time"] as? Double {
            let time = NSDate(timeIntervalSince1970: theDate)
            let dateFormatter = DateFormatter()
            
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE, MMM d"
            
            let localDate = dateFormatter.string(from: time as Date)
            
            self._date = localDate
        }
        
    }
    
}
