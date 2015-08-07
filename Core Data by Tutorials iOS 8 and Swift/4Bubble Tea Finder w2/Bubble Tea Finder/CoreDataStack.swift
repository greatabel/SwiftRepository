//
//  CoreDataStack.swift
//  WorldCup
//
//  Created by Pietro Rea on 8/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
  
  var context:NSManagedObjectContext
  var psc:NSPersistentStoreCoordinator
  var model:NSManagedObjectModel
  var store:NSPersistentStore?
  
  init() {
    
    let bundle = NSBundle.mainBundle()
    let modelURL =
    bundle.URLForResource("Model", withExtension:"momd")
    model = NSManagedObjectModel(contentsOfURL: modelURL!)!
    
    psc = NSPersistentStoreCoordinator(managedObjectModel:model)
    
    context = NSManagedObjectContext()
    context.persistentStoreCoordinator = psc
    
    let documentsURL =
    CoreDataStack.applicationDocumentsDirectory()
    
    let storeURL =
    documentsURL.URLByAppendingPathComponent("Bubble_Tea_Finder")
    
    let options =
    [NSMigratePersistentStoresAutomaticallyOption: true]
    
    var error: NSError? = nil
    do {
      store = try psc.addPersistentStoreWithType(NSSQLiteStoreType,
        configuration: nil,
        URL: storeURL,
        options: options)
    } catch let error1 as NSError {
      error = error1
      store = nil
    }
    
    if store == nil {
      print("Error adding persistent store: \(error)")
      abort()
    }
    
  }
  
  func saveContext() {
    
    var error: NSError? = nil
    if context.hasChanges {
      do {
        try context.save()
      } catch let error1 as NSError {
        error = error1
        print("Could not save: \(error), \(error?.userInfo)")
      }
    }
    
  }
  
  class func applicationDocumentsDirectory() -> NSURL {
    
    let fileManager = NSFileManager.defaultManager()
    
    let urls = fileManager.URLsForDirectory(.DocumentDirectory,
      inDomains: .UserDomainMask) 
    
    return urls[0]
  }
  
}