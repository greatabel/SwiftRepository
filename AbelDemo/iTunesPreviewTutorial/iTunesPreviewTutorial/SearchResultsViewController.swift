//
//  ViewController.swift
//  iTunesPreviewTutorial
//
//  Created by Jameson Quave on 4/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//  http://jamesonquave.com/blog/developing-ios-apps-using-swift-tutorial-part-2/
//  http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol  {
    
    var imageCache = [String: UIImage]()
    
    let kCellIdentifier: String = "SearchResultCell"
    
    let api = APIController()
    
    var tableData = []
    @IBOutlet weak var appsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchItunesFor("JQ Software")
        api.searchItunesFor("Angry Birds")
        api.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier)
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary,
            // Grab the artworkUrl60 key to get an image URL for the app's thumbnail
            urlString = rowData["artworkUrl60"] as? String,
            imgURL = NSURL(string: urlString),
            // Get the formatted price string for display in the subtitle
            formattedPrice = rowData["formattedPrice"] as? String,
            // Download an NSData representation of the image at the URL
//            imgData = NSData(contentsOfURL: imgURL),
            // Get the track name
            trackName = rowData["trackName"] as? String {
                // Get the formatted price string for display in the subtitle
                cell!.detailTextLabel?.text = formattedPrice
                // Update the imageView cell to use the downloaded image data
                
//                cell!.imageView?.image = UIImage(data: imgData)
                 cell!.imageView?.image = UIImage(named: "Blank52.png")
                
                if let img = imageCache[urlString]{
                    print("Already here:\(urlString)")
                    cell?.imageView?.image = img
                }else{
                    // image isn't cached
                    let request: NSURLRequest = NSURLRequest(URL: imgURL)
                    let mainQueue = NSOperationQueue.mainQueue()
                    NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: {
                        (response, data, error) -> Void in
                        print("##")
                            let image =  UIImage(data:data!)
                            self.imageCache[urlString] = image
                            dispatch_async(dispatch_get_main_queue(), {
                                if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath){
                                    cellToUpdate.imageView?.image = image
                                }
                            })
                        
                        
                    })
                }
                
                // Update the textLabel text to use the trackName from the API
                cell!.textLabel?.text = trackName
        }
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let rowData = self.tableData[indexPath.row] as? NSDictionary,
        name = rowData["trackName"] as? String,
            formattedPrice = rowData["formattedPrice"] as? String{
                let alert = UIAlertController(title: name, message: formattedPrice, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
//    func searchItunesFor(searchTerm: String) {
//        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
//        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
//        
//        // Now escape anything else that isn't URL-friendly
//        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
//            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
//            let url = NSURL(string: urlPath)
//            let session = NSURLSession.sharedSession()
//            let task =  session.dataTaskWithURL(url!, completionHandler:
//                {data, response, error -> Void in
//                    
//                    print("Task completed")
//                    if(error != nil) {
//                        // If there is an error in the web request, print it to the console
//                        print(error!.localizedDescription)
//                    }
//                    do{
//                    if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
//                        
//                            // If there is an error parsing JSON, print it to the console
////                            print("JSON Error \(err!.localizedDescription)")
//                        
//                        if let results: NSArray = jsonResult["results"] as? NSArray {
//                            print("@@@\(results.count)")
//                            dispatch_async(dispatch_get_main_queue(), {
//                                print("### \(results.count)")
//                                self.tableData = results
//                                self.appsTableView!.reloadData()
//                            })
//                        }
//                    }
//                    }catch{
//                        
//                    }
//
//                            })
//            
//            // The task is just an object with all these properties set
//            // In order to actually make the web request, we need to "resume"
//            task.resume()
//        }
//    }
    
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(),{
          self.tableData = results
          self.appsTableView!.reloadData()
        })
    }

}

