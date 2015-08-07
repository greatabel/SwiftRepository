//
//  Venue.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import Foundation
import CoreData

class Venue: NSManagedObject {
  
  @NSManaged var name: String?
  @NSManaged var phone: String?
  @NSManaged var specialCount: NSNumber?
  @NSManaged var favorite: NSNumber?
  @NSManaged var location: Location
  @NSManaged var category: Category
  @NSManaged var stats: Stats
  @NSManaged var priceInfo: PriceInfo
  
}
