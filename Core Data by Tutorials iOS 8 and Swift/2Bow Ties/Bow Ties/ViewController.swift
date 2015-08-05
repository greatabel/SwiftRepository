//
//  ViewController.swift
//  Bow Ties
//
//  Created by Pietro Rea on 6/25/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var timesWornLabel: UILabel!
  @IBOutlet weak var lastWornLabel: UILabel!
  @IBOutlet weak var favoriteLabel: UILabel!
    
  var managedContext: NSManagedObjectContext!

    var currentBowtie: Bowtie!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1
    insertSampleData()
    
    //2 
    let request = NSFetchRequest(entityName: "Bowtie")
    let firstTitle = segmentedControl.titleForSegmentAtIndex(0)
    
    request.predicate = NSPredicate(format: "searchKey == %@", firstTitle!)
    
    //3
    var error: NSError? = nil
    
    var results = managedContext.executeFetchRequest(request, error: &error) as! [Bowtie]?
    
    //4
    if let bowties = results{
        currentBowtie = bowties[0]
        populate(currentBowtie)
    }else{
        println("Could not fetch \(error),\(error!.userInfo)")
    }
    
  }
    
    func populate(bowtie: Bowtie){
        imageView.image = UIImage(data:bowtie.photoData)
        nameLabel.text = bowtie.name
        ratingLabel.text = "Rating: \(bowtie.rating.doubleValue)/5"
        
        timesWornLabel.text = "# times worn: \(bowtie.timesWorn.integerValue)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        
        lastWornLabel.text = "Last worn:" + dateFormatter.stringFromDate(bowtie.lastWorn)
        
        favoriteLabel.hidden = !bowtie.isFavorite.boolValue
        
        view.tintColor = bowtie.tintColor as! UIColor
        
    }
  
  @IBAction func segmentedControl(control: UISegmentedControl) {
    
    
  }

  @IBAction func wear(sender: AnyObject) {
    
  }
  
  @IBAction func rate(sender: AnyObject) {
    let alert = UIAlertController(title: "New Rating",
        message: "Rate this bow tie",
        preferredStyle: UIAlertControllerStyle.Alert)
    
    let cancelAction = UIAlertAction(
        title: "Cancel",
        style: .Default,
        handler: {(action: UIAlertAction!) in
    })
    
    let saveAction = UIAlertAction(title: "Save",
        style: .Default,
        handler: { (action: UIAlertAction!) in
            
            let textField = alert.textFields![0] as! UITextField
            self.updateRating(textField.text)
            
    })
    
    alert.addTextFieldWithConfigurationHandler{
        (textField: UITextField!) in
        
    }
    
    alert.addAction(cancelAction)
    alert.addAction(saveAction)
    
    self.presentViewController(alert, animated: true, completion: nil)
    
    
    }

    func updateRating(numString: String) {
        currentBowtie!.rating = (numString as NSString).doubleValue
        
        var error: NSError?
        if !self.managedContext.save(&error) {
            println("@^@:\(error)")
            if error!.code == NSValidationNumberTooLargeError ||
                error!.code == NSValidationNumberTooSmallError {
                    
                    rate(currentBowtie)
            }
        } else {
            populate(currentBowtie)
        }
    }
  

    func insertSampleData(){
        
        let fetchRequest = NSFetchRequest(entityName: "Bowtie")
        fetchRequest.predicate  = NSPredicate(
            format:"searchKey != nil"
        )
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil);
        
        if count > 0 {return }
        
        let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        
        if let dataArray = NSArray(contentsOfFile: path!){
            for dict : AnyObject in dataArray {
                let entity = NSEntityDescription.entityForName("Bowtie", inManagedObjectContext: managedContext)
                let bowtie = Bowtie(entity: entity!, insertIntoManagedObjectContext: managedContext)
                let btDict = dict as! NSDictionary
              
                bowtie.name = btDict["name"] as! String
                bowtie.searchKey = btDict["searchKey"] as! String
                bowtie.rating = btDict["rating"] as! NSNumber
                let tintColorDict = btDict["tintColor"] as! NSDictionary
                bowtie.tintColor = colorFromDict(tintColorDict)
                
                let imageName = btDict["imageName"] as! String
                let image = UIImage(named:imageName)
                let photoData = UIImagePNGRepresentation(image)!
                bowtie.photoData = photoData
                
                bowtie.lastWorn = btDict["lastWorn"] as! NSDate
                bowtie.timesWorn = btDict["timesWorn"] as! NSNumber
                bowtie.isFavorite = btDict["isFavorite"] as! NSNumber
            }

            
        }
        
        
        var error: NSError?
        if !managedContext.save(&error) {
                println("Could not save \(error), \(error!.userInfo)")
        }
        
        
        
    }
    
    func colorFromDict(dict: NSDictionary) -> UIColor{
        let red = dict["red"] as! NSNumber
        let green = dict["green"]as! NSNumber
        let blue = dict["blue"]as! NSNumber
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255,
            alpha: 1)
        
        return color;
        
        
    }
    
    
}

