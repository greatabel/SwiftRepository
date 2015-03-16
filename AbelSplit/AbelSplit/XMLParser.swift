//
//  XMLParser.swift
//  AbelSplit
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//



import UIKit

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}


class XMLParser: NSObject, NSXMLParserDelegate {
    
    var delegate : XMLParserDelegate?
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharacters = ""
    
    
    func startParsingWithContentsOfURL(rssURL: NSURL){
        let parser = NSXMLParser(contentsOfURL: rssURL)
        parser?.delegate = self
        parser?.parse()
    }
    
    //XML Parser Delegate Mothods
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        currentElement = elementName
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharacters.isEmpty{
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substringFromIndex(3)
            }
            
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate"{
                arrParsedData.append(currentDataDictionary)
            }
        }
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser!){
        delegate?.parsingWasFinished()
    }
    
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        println(parseError.description)
    }
    
    func parser(parser: NSXMLParser!, validationErrorOccurred validationError: NSError!) {
        println(validationError.description)
    }
    
}

