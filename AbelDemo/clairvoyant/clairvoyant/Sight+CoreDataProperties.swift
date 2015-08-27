//
//  Sight+CoreDataProperties.swift
//  clairvoyant
//
//  Created by 万畅 on 15/8/13.
//  Copyright © 2015年 Luminagic. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Sight {

    @NSManaged var date: NSDate?
    @NSManaged var finalscore: NSNumber?
    @NSManaged var raw: String?
    @NSManaged var user: User?

}
