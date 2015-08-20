//
//  Todo.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

struct Todo: Equatable {
    let description: String
    let list: List
    let dueDate: NSDate
    let done: Bool
    let doneDate: NSDate?
}

func ==(todo1: Todo, todo2: Todo) -> Bool {
    return todo1.description == todo2.description
        && todo1.dueDate == todo2.dueDate
}

func todoFromDictionary(dict: Dictionary<String, AnyObject>) -> Todo {
    return Todo(description: dict["description"] as! String!,
        list: List(description: dict["list"] as! String!),
        dueDate: dict["dueDate"] as! NSDate!,
        done: dict["done"] as! Bool!,
        doneDate: dict["doneDate"] as? NSDate)
}

func todoToDictionary(todo: Todo) -> NSDictionary {
    let dict: NSDictionary = [
        "description": todo.description,
        "list": todo.list.description,
        "dueDate": todo.dueDate,
        "done": todo.done,
        "doneDate": todo.doneDate ?? ""
    ]
    return dict
}