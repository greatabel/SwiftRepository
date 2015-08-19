//
//  Todo+CoreDataProperties.swift
//  
//
//  Created by 万畅 on 15/8/19.
//
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Todo {

    @NSManaged var descriptionText: String?
    @NSManaged var done: NSNumber?
    @NSManaged var doneDate: NSDate?
    @NSManaged var dueDate: NSDate?
    @NSManaged var list: String?

}
