//
//  CoreDataStack.swift
//  
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
        bundle.URLForResource("clairvoyant", withExtension:"momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        
        // 2
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        // 3
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = psc
        
        // 4
        let documentsURL =
        CoreDataStack.applicationDocumentsDirectory()
        print("documentURL = \(documentsURL)")
        
        let storeURL =
        documentsURL.URLByAppendingPathComponent("clairvoyant")
        
        let options =
        [NSMigratePersistentStoresAutomaticallyOption: true]
        
//        var error: NSError? = nil
        
        do{
         try    store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options)
            
            
            
        }  catch let unknownError {
            print("\(unknownError) is an unknown error.")
            store = nil
            }

       
        
       
        
        
    }
    
    func saveContext(){
        var error:NSError? = nil
        do{
            if context.hasChanges {
                try context.save()
            }
            
        }catch let unknownError {
            print("\(unknownError) is an unknown error.")
        }
//        if context.hasChanges && !context.save(&error){
//            print("Cound not save:\(error), \(error?.userInfo)")
//        }
    }
    
    class func applicationDocumentsDirectory() -> NSURL{
        
        let fileManager = NSFileManager.defaultManager()
        
        let urls = fileManager.URLsForDirectory(.DocumentDirectory,
            inDomains: .UserDomainMask) as! [NSURL]
        
        
        return urls[0]
    }
    
}
