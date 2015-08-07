//
//  ViewController.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var coreDataStack: CoreDataStack!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  func tableView(tableView: UITableView?,
    numberOfRowsInSection section: Int) -> Int {
      return 10
  }
  
    
    
  func tableView(tableView: UITableView!,
    cellForRowAtIndexPath
    indexPath: NSIndexPath!) -> UITableViewCell! {
      
      var cell = tableView.dequeueReusableCellWithIdentifier("VenueCell")!
      cell.textLabel!.text = "Bubble Tea Venue"
      cell.detailTextLabel!.text = "Price Info"
      
      return cell
  }
  
override  func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "toFilterViewController" {
      
      let navController = segue.destinationViewController as! UINavigationController
      let filterVC = navController.topViewController as! FilterViewController
    }
  }
  
  @IBAction  func unwindToVenuListViewController(segue: UIStoryboardSegue) {
    
  }
}


