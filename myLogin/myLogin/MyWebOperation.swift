//
//  MyWebOperation.swift
//  myLogin
//
//  Created by liwei on 15/4/29.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import Foundation



func testFunc( completionHandler: (genres: NSDictionary) -> () )
{
    
    let urlAsString = "http://61.183.87.134:8090/mobile/login.jspx?name=13720303703&pwd=13720303703"
//    let urlAsString = inputurl;
    let url = NSURL(string: urlAsString)!
    let urlSession = NSURLSession.sharedSession()
    
    
    //2
    let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
        if (error != nil) {
            NSLog(error.localizedDescription)
        }
        var err: NSError?
        
        
        
        
        // 3
        var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
        if (err != nil) {
            
            NSLog("JSON Error \(err!.localizedDescription)")
        }
        let json = JSON(jsonResult)
        let printableString = json.description
        NSLog(printableString)
        
        let myresults:JSON = json["results"]
        let resultsBool: Bool? = myresults.bool!
        
        let userinfo:JSON = json["userInfo"]
        
        let phoneString = userinfo["phone"].string!
        let idString = userinfo["id"].string!
        
        
        
//        NSLog("test ## %@ %@ %@",resultsBool!,phoneString,idString)
        var returnString = ""
        returnString = String(format: "test here ->: %@ %@ %@", resultsBool!,phoneString,idString)
        
//           var na:NSArray = ["Pencil","Eraser", returnString]
        var namesDictionary: Dictionary<String, String> = [:]
        namesDictionary["result"] = "1"
        namesDictionary["phone"] = phoneString
        completionHandler(genres: namesDictionary)
        
    })
    // 5
    jsonQuery.resume()
    
    
    
}

