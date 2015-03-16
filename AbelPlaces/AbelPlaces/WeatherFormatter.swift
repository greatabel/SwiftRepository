//
//  WeatherFormatter.swift
//  AbelPlaces
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import Foundation

/** Creates display text from a Weather object. */
class WeatherFormatter
{
    init(useCelcius: Bool)
    {
        self.useCelcius = useCelcius
    }
    
    func formatWeather(weather: Weather) -> String
    {
        let
        temp    = useCelcius ? weather.temperatureC : weather.temperatureF,
        symbol  = useCelcius ? "C" : "F"
        return "\(Int(temp))°\(symbol)  \(weather.humidity)% humidity"
    }
    
    private let useCelcius: Bool
}

