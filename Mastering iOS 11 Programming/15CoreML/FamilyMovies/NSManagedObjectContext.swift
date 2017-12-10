//
//  NSManagedObjectContext.swift
//  FamilyMovies
//
//  Created by Donny Wals on 24/06/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func persist(block: @escaping ()->Void) {
        perform {
            block()
            
            do {
                try self.save()
            } catch {
                self.rollback()
            }
        }
    }
}
