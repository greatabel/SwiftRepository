//
//  Stats.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import Foundation
import CoreData

class Stats: NSManagedObject {

    @NSManaged var checkinsCount: NSNumber?
    @NSManaged var usersCount: NSNumber?
    @NSManaged var tipCount: NSNumber?
    @NSManaged var venue: Venue

}
