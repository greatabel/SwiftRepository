//
//  Dog.swift
//  Dog Walk
//
//  Created by 万畅 on 15/8/6.
//  Copyright (c) 2015年 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Dog: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var walks: NSOrderedSet

}
