//
//  Model Builders.m
//  AbelPlaces
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//


#import "Model Builders.h"
#import "AbelPlaces-Swift.h"

NSArray *BuildPlacesFromJSON(id json)
{
    NSMutableArray *places = [NSMutableArray array];
    for (NSDictionary *dict in [json valueForKey:@"postalCodes"])
        [places addObject:
         [[Place alloc] initWithLatitude:[dict[@"lat"] doubleValue]
                               longitude:[dict[@"lng"] doubleValue]
                                    name:dict[@"placeName"]
                              postalCode:dict[@"postalCode"]]];
    return places;
}

Weather *BuildWeatherFromJSON(id json)
{
    NSDictionary *dict = [json valueForKey:@"weatherObservation"];
    NSString *tempString = dict[@"temperature"] ?: @"";
    double temperature = 0.0;
    [[NSScanner scannerWithString:tempString] scanDouble:&temperature];
    return [[Weather alloc] initWithCelcius:temperature
                                   humidity:[dict[@"humidity"] intValue]];
}
