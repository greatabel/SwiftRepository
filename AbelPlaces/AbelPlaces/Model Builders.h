//
//  Model Builders.h
//  AbelPlaces
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>

@class Weather;

/** Creates an array of Place data objects. */
extern NSArray *BuildPlacesFromJSON(id json);

/** Creates a Weather data object. */
extern Weather *BuildWeatherFromJSON(id json);
