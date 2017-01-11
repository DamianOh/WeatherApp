//
//  ForecastCell.swift
//  weather
//
//  Created by Damian Ortiz on 1/10/17.
//  Copyright © 2017 Domino. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    //@IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var forecastDate: UILabel!
    @IBOutlet weak var forecastDescription: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(forecast: Forecast) {
        
        forecastDate.text = forecast.date
        forecastDescription.text = forecast.description
        highTemp.text = "\(Int(forecast.highTemp))°"
        lowTemp.text = "\(Int(forecast.lowTemp))°"
        //weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }

}
