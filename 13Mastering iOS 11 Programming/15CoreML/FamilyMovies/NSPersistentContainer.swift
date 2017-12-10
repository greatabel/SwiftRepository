//
//  NSPersistentContainer.swift
//  FamilyMovies
//
//  Created by Donny Wals on 31/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import CoreData

extension NSPersistentContainer {
    func saveContextIfNeeded() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
