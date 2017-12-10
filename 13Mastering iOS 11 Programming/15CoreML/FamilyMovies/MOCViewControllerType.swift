//
//  MOCViewControllerType.swift
//  FamilyMovies
//
//  Created by Donny Wals on 31/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import CoreData

protocol MOCViewControllerType {
    var managedObjectContext: NSManagedObjectContext? { get set }
}
