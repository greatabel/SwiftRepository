//
//  Weather.swift
//  AbelPlaces
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import Foundation

/**
Data entity that represents the current weather of a Place.
Subclasses NSObject to enable Obj-C instantiation.
*/
class Weather : NSObject
{
    let
    temperatureC: Double,
    temperatureF: Double,
    humidity:     Int
    
    init(celcius: Double, humidity: Int)
    {
        self.temperatureC = celcius
        self.temperatureF = celcius * 9/5 + 32
        self.humidity     = humidity
    }
}

