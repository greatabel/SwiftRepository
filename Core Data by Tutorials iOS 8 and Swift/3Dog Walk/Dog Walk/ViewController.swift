//
//  ViewController.swift
//  Dog Walk
//
//  Created by Pietro Rea on 7/10/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet var tableView: UITableView!
    
    var managedContext: NSManagedObjectContext!
    
    var currentDog : Dog!
    
//  var walks:Array<NSDate> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // insert dog entity
    let dogEntity = NSEntityDescription.entityForName("Dog", inManagedObjectContext: managedContext)
    
    let dogName = "Fido"
    let dogFetch = NSFetchRequest(entityName: "Dog")
    dogFetch.predicate = NSPredicate(format:"name == %@", dogName)
    
    var error: NSError?
    
    let result = managedContext.executeFetchRequest(dogFetch, error: &error) as! [Dog]?
    
    if let dogs = result {
        
        if dogs.count == 0 {
            
            currentDog = Dog(entity: dogEntity!,
                insertIntoManagedObjectContext: managedContext)
            currentDog.name = dogName
            
            if !managedContext.save(&error) {
                println("Could not save: \(error)")
            }
        } else {
            currentDog = dogs[0]
        }
        
    } else {
        println("\(error)")
    }
    
    tableView.registerClass(UITableViewCell.self,
      forCellReuseIdentifier: "Cell")
  }
  
  func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    
      return currentDog.walks.count;
  }
  
  func tableView(tableView: UITableView,
    titleForHeaderInSection section: Int) -> String? {
      return "List of Walks";
  }
  
  func tableView(tableView: UITableView,
    cellForRowAtIndexPath
    indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell =
      tableView.dequeueReusableCellWithIdentifier("Cell",
      forIndexPath: indexPath) as! UITableViewCell
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .ShortStyle
    dateFormatter.timeStyle = .MediumStyle
    
    let walk = currentDog.walks[indexPath.row] as! Walk
    
        cell.textLabel!.text =
        dateFormatter.stringFromDate(walk.date)
    
    return cell
  }
  
  @IBAction func add(sender: AnyObject) {
    
    
    tableView.reloadData()
  }
  
}

