//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by 万畅 on 15/8/6.
//  Copyright (c) 2015年 Razeware. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    let context: NSManagedObjectContext
    let psc: NSPersistentStoreCoordinator
    let model:NSManagedObjectModel
    let store: NSPersistentStore?
    
    init(){
        // 1
        let bundle = NSBundle.mainBundle()
        let modelURL =
        bundle.URLForResource("Dog Walk", withExtension:"momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!

        
       // 2
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        //3
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        //4
        let documentsURL =
        CoreDataStack.applicationDocumentsDirectory()
        println("documentURL = \(documentsURL)")
        
        let storeURL =
        documentsURL.URLByAppendingPathComponent("Dog Walk")
        
        let options =
        [NSMigratePersistentStoresAutomaticallyOption: true]
        
        var error: NSError? = nil
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        
        if store == nil {
            println("Error adding persistent store:\(error)")
            abort()
        }
        
        
    }
    
    func saveContext(){
        var error:NSError? = nil
        if context.hasChanges && !context.save(&error){
            println("Cound not save:\(error), \(error?.userInfo)")
        }
    }
    
    class func applicationDocumentsDirectory() -> NSURL{
        
        let fileManager = NSFileManager.defaultManager()
        
        let urls = fileManager.URLsForDirectory(.DocumentDirectory,
            inDomains: .UserDomainMask) as! [NSURL]

        
        return urls[0]
    }
    
}
