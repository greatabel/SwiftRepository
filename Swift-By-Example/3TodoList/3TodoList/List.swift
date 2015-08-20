//
//  List.swift
//  Todolist
//
//  Created by Giordano Scalzo on 08/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

struct List {
    let description: String
}

func listFromDictionary(dict: Dictionary<String, AnyObject>) -> List {
    return List(description: dict["description"] as! String!)
}

func listToDictionary(list: List) -> NSDictionary {
    let dict: NSDictionary = [
        "description": list.description,
    ]
    return dict
}