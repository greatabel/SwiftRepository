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
    do {
        if let dogs = try managedContext.executeFetchRequest(dogFetch) as? [Dog] {

            if dogs.count == 0 {

                currentDog = Dog(entity: dogEntity!,
                    insertIntoManagedObjectContext: managedContext)
                currentDog.name = dogName

                do {
                    try managedContext!.save()
                }catch{

                }
            } else {
                currentDog = dogs[0]
            }

        }

    }catch{

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
    
    //可编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            //1
            let walkToRemove =
            currentDog.walks[indexPath.row] as! Walk
            
            //2
            managedContext.deleteObject(walkToRemove)
            
            // 3
            do {
                try managedContext!.save()
            }catch{
                
            }
            
            // 4
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        
    }
  
  @IBAction func add(sender: AnyObject) {
    
    //insert new Walk entity into core data
    let walkEntity = NSEntityDescription.entityForName("Walk",
        inManagedObjectContext: managedContext)
    
    let walk = Walk(entity: walkEntity!, insertIntoManagedObjectContext: managedContext)
    
    walk.date = NSDate()
    
    // Insert the new walk into the dog walk set
    let walks = currentDog.walks.mutableCopy() as! NSMutableOrderedSet
    print("walks=", walks)
    
    walks.addObject(walk)
    
    currentDog.walks = walks.copy() as! NSOrderedSet

    do {
        try managedContext!.save()
    }catch{

    }

    
    
    
    tableView.reloadData()
  }
  
}

