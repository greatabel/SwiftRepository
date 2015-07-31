//
//  PlaceFormatter.swift
//  AbelPlaces
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import Foundation

/** Creates display text from a Place object. */
class PlaceFormatter
{
    class func formatCoordinatesForPlace(place: Place) -> String
    {
        let
        fmt = { String(format: "%.2f", $0) },
        lat = fmt(place.latitude),
        lng = fmt(place.longitude)
        return "(\(lat), \(lng))"
    }
}

