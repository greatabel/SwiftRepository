//
//  Bowtie.swift
//  Bow Ties
//
//  Created by 万畅 on 15/8/5.
//  Copyright (c) 2015年 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Bowtie: NSManagedObject {

    @NSManaged var isFavorite: NSNumber
    @NSManaged var lastWorn: NSDate
    @NSManaged var name: String
    @NSManaged var photoData: NSData
    @NSManaged var rating: NSNumber
    @NSManaged var searchKey: String
    @NSManaged var timesWorn: NSNumber
    @NSManaged var tintColor: AnyObject

}
