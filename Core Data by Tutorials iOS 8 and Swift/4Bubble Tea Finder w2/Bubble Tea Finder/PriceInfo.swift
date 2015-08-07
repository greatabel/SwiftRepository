//
//  PriceInfo.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import Foundation
import CoreData

class PriceInfo: NSManagedObject {

    @NSManaged var priceCategory: String?
    @NSManaged var venue: Venue

}
