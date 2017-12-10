//
//  Movie.swift
//  FamilyMovies
//
//  Created by Donny Wals on 01/07/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import CoreData

extension Movie {
    static func find(byName name: String, inContext moc: NSManagedObjectContext) -> Movie? {
        let predicate = NSPredicate(format: "name ==[dc] %@", name)
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = predicate
        
        guard let result = try? moc.fetch(request)
            else { return nil }
        
        return result.first
    }
    
    static func find(byName name: String, orCreateIn moc: NSManagedObjectContext) -> Movie {
        let predicate = NSPredicate(format: "name ==[dc] %@", name)
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = predicate
        
        guard let result = try? moc.fetch(request)
            else { return Movie(context: moc) }
        
        return result.first ?? Movie(context: moc)
    }
}
