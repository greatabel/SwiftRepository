//
//  AppDelegate.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?
  lazy var  coreDataStack = CoreDataStack()

  
  func application(application: UIApplication,
    didFinishLaunchingWithOptions
    launchOptions: [NSObject: AnyObject]?) -> Bool {
      
      importJSONSeedDataIfNeeded()
      
      let navController = window!.rootViewController as! UINavigationController
      let viewController = navController.topViewController as! ViewController
      viewController.coreDataStack = coreDataStack
      
      return true
  }
  
  func applicationWillTerminate(application: UIApplication) {
    coreDataStack.saveContext()
  }
  
  func importJSONSeedDataIfNeeded() {
    
    let fetchRequest = NSFetchRequest(entityName: "Venue")
    var error: NSError? = nil
    
    let results =
      coreDataStack.context.countForFetchRequest(fetchRequest,
        error: &error)
    
    if (results == 0) {
      
      var fetchError: NSError? = nil
      
      let results =
        try! coreDataStack.context.executeFetchRequest(fetchRequest) as! [Venue]
      
      for object in results {
        let team = object as Venue
        coreDataStack.context.deleteObject(team)
      }
      
      coreDataStack.saveContext()
      importJSONSeedData()
    }
  }
  
  func importJSONSeedData() {
    let jsonURL = NSBundle.mainBundle().URLForResource("seed", withExtension: "json")
    let jsonData = NSData(contentsOfURL: jsonURL!)
    
    var error: NSError? = nil
    let jsonDict = try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: []) as! NSDictionary
    
    let venueEntity = NSEntityDescription.entityForName("Venue", inManagedObjectContext: coreDataStack.context)

    let locationEntity = NSEntityDescription.entityForName("Location", inManagedObjectContext: coreDataStack.context)

    let categoryEntity = NSEntityDescription.entityForName("Category", inManagedObjectContext: coreDataStack.context)

    let priceEntity = NSEntityDescription.entityForName("PriceInfo", inManagedObjectContext: coreDataStack.context)

    let statsEntity = NSEntityDescription.entityForName("Stats", inManagedObjectContext: coreDataStack.context)

    let jsonArray = jsonDict.valueForKeyPath("response.venues") as! NSArray
    
    for jsonDictionary in jsonArray {

      let venueName = jsonDictionary["name"] as? String
      let venuePhone = jsonDictionary.valueForKeyPath("contact.phone") as? String
      let specialCount = jsonDictionary.valueForKeyPath("specials.count") as? NSNumber

      let locationDict = jsonDictionary["location"] as! NSDictionary
      let priceDict = jsonDictionary["price"] as! NSDictionary
      let statsDict = jsonDictionary["stats"] as! NSDictionary

      let location = Location(entity: locationEntity!, insertIntoManagedObjectContext: coreDataStack.context)
      location.address = locationDict["address"] as? String
      location.city = locationDict["city"] as? String
      location.state = locationDict["state"] as? String
      location.zipcode = locationDict["postalCode"] as? String
      location.distance = locationDict["distance"] as? NSNumber

      let category = Category(entity: categoryEntity!, insertIntoManagedObjectContext: coreDataStack.context)

      let priceInfo = PriceInfo(entity: priceEntity!, insertIntoManagedObjectContext: coreDataStack.context)
      priceInfo.priceCategory = priceDict["currency"] as? String
      
      let stats = Stats(entity: statsEntity!, insertIntoManagedObjectContext: coreDataStack.context)
      stats.checkinsCount = statsDict["checkinsCount"] as? NSNumber
      stats.usersCount = statsDict["userCount"] as? NSNumber
      stats.tipCount = statsDict["tipCount"] as? NSNumber

      let venue = Venue(entity: venueEntity!, insertIntoManagedObjectContext: coreDataStack.context)
      venue.name = venueName
      venue.phone = venuePhone
      venue.specialCount = specialCount
      venue.location = location
      venue.category = category
      venue.priceInfo = priceInfo
      venue.stats = stats
    }
    
    coreDataStack.saveContext()
  }

}

