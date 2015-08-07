//
//  Location.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var address: String?
    @NSManaged var city: String?
    @NSManaged var state: String?
    @NSManaged var zipcode: String?
    @NSManaged var country: String?
    @NSManaged var distance: NSNumber?
    @NSManaged var venue: Venue

}
