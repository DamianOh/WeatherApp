//
//  Location.swift
//  weather
//
//  Created by Damian Ortiz on 1/10/17.
//  Copyright © 2017 Domino. All rights reserved.
//
import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
