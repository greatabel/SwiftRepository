//
//  TodosDatastore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class TodosDatastore {
    private var savedLists = Array<List>()
    private var savedTodos = Array<Todo>()
    private let storageDatastore: StorageDatastore
    
    init(storageDatastore: StorageDatastore){
        self.storageDatastore = storageDatastore
        savedLists = storageDatastore.lists()
        savedTodos = storageDatastore.todos()
    }
    
    func defaultList() -> List {
        return List(description: "Personal")
    }
    
    func defaultDueDate() -> NSDate {
        let now = NSDate()
        let secondsInADay = NSTimeInterval(24 * 60 * 60)
        return now.dateByAddingTimeInterval(secondsInADay)
    }
    
    
    func todos() -> Array<Todo> {
        return savedTodos
    }
    
    func lists() -> Array<List> {
        return [defaultList()] + savedLists
    }
}

// MARK: Actions
extension TodosDatastore {
    func addListDescription(description: String) {
        if !description.isEmpty {
            storageDatastore.addList(List(description: description))
            savedLists = storageDatastore.lists()
        }
    }
    
    func addTodo(todo: Todo) {
        storageDatastore.addTodo(todo)
        savedTodos = storageDatastore.todos()
    }
    
    func deleteTodo(todo: Todo?) {
        if let todo = todo {
            storageDatastore.deleteTodo(todo)
            savedTodos = storageDatastore.todos()
        }
    }
    
    func doneTodo(todo: Todo) {
        deleteTodo(todo)
        let doneTodo = Todo(description: todo.description,
            list: todo.list,
            dueDate:
            todo.dueDate,
            done: true,
            doneDate: NSDate())
        addTodo(doneTodo)
    }
}