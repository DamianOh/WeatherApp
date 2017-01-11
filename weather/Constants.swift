//
//  Constants.swift
//  weather
//
//  Created by Damian Ortiz on 1/9/17.
//  Copyright © 2017 Domino. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.darksky.net/forecast/"
let LATITUDE = Location.sharedInstance.latitude!
let LONGITUDE = Location.sharedInstance.longitude!
let API_KEY = "19de5584bba01939ffb11da4e82f33ab/"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(API_KEY)\(LATITUDE),\(LONGITUDE)"


