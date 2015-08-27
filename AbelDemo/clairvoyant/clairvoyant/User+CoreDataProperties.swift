//
//  User+CoreDataProperties.swift
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

extension User {

    @NSManaged var age: NSNumber?
    @NSManaged var grade: String?
    @NSManaged var name: String?
    @NSManaged var sex: String?
    @NSManaged var sights: Sight?

}
