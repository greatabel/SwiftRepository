//
//  TopicsTableViewController.swift
//  AbelSplit
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//



import UIKit

class TopicsTableViewController: UITableViewController, XMLParserDelegate {
    
    var xmlParser : XMLParser!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let url = NSURL(string: "http://feeds.feedburner.com/appcoda")
        xmlParser = XMLParser()
        xmlParser.delegate = self
        xmlParser.startParsingWithContentsOfURL(url!)
        
    }
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return xmlParser.arrParsedData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as UITableViewCell
        
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        cell.textLabel!.text = currentDictionary["title"];
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        let tutorialLink = dictionary["link"]
        let publishDate = dictionary["pubDate"]
        
        let tutorialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idTutorialViewController") as TutorialViewController
        
        tutorialViewController.tutorialURL = NSURL(string: tutorialLink!)
        tutorialViewController.publishDate = publishDate
        
        showDetailViewController(tutorialViewController, sender: self)
    }
    
}
