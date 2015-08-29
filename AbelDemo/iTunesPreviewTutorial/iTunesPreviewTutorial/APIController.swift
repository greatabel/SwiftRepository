//
//  APIController.swift
//  iTunesPreviewTutorial
//
//  Created by 万畅 on 15/8/29.
//  Copyright © 2015年 JQ Software LLC. All rights reserved.
//

import Foundation

protocol APIControllerProtocol{
    func didReceiveAPIResults(results: NSArray)
}

class APIController{
    
    var delegate: APIControllerProtocol?
    
    func searchItunesFor(searchTerm: String){
        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        // Now escape anything else that isn't URL-friendly
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                
                
                do{
                    
                    var jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                   
                    if let results: NSArray = jsonResult["results"] as! NSArray{
                        self.delegate?.didReceiveAPIResults(results)
                    }
//                    dispatch_async(dispatch_get_main_queue(), {
////                        self.tableData = results
////                        self.appsTableView!.reloadData()
//                    })

                    
                    
                }catch{
                    
                }
                            })
            task.resume()
            
        }
    }
    
    
}