//
//  FamilyMember.swift
//  FamilyMovies
//
//  Created by Donny Wals on 01/08/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import Foundation
import CoreData

extension FamilyMember {
    static func find(byName name: String, inContext moc: NSManagedObjectContext) -> FamilyMember? {
        let predicate = NSPredicate(format: "name ==[dc] %@", name)
        let request: NSFetchRequest<FamilyMember> = FamilyMember.fetchRequest()
        request.predicate = predicate
        
        guard let result = try? moc.fetch(request)
            else { return nil }
        
        return result.first
    }
}
