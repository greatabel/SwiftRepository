//
//  FileSystemDataStore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 14/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class FileSystemDataStore: StorageDatastore {
    
    func todos() -> Array<Todo> {
        let path = fileNameEntity("todo")
        
        if let rawData = NSData(contentsOfFile: path) {
            
            let scoreArray: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(rawData)
            
            let aa = scoreArray as? Array<Dictionary<String, AnyObject>>
            let bb = aa?.map { todoFromDictionary($0) }
            return bb ?? []
            
        }
        return []
    }
    
    
    func lists() -> Array<List>{
        let path = fileNameEntity("list")
        
        if let rawData = NSData(contentsOfFile: path) {
            
            let scoreArray: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(rawData)
            
            let aa = scoreArray as? Array<Dictionary<String, AnyObject>>
            let bb = aa?.map { listFromDictionary($0) }
            return bb ?? []
            
        }
        return []
    }
    
    func addTodo(todo: Todo){
        let todos1 = todos() + [todo]
        let todosToSave = todos1.map { todoToDictionary($0)}
        
        let saveData = NSKeyedArchiver.archivedDataWithRootObject(todosToSave);
        
        saveData.writeToFile(fileNameEntity("todo"), atomically: true);
        
    }
    func deleteTodo(todo: Todo){
        let todos1 = todos().filter {$0 != todo}
        let todosToSave = todos1.map { todoToDictionary($0)}
        
        let saveData = NSKeyedArchiver.archivedDataWithRootObject(todosToSave);
        
        saveData.writeToFile(fileNameEntity("todo"), atomically: true);
        
    }
    
    func addList(list: List){
        let lists1 = lists() + [list]
        let todosToSave = lists1.map { listToDictionary($0)}
        
        let saveData = NSKeyedArchiver.archivedDataWithRootObject(todosToSave);
        
        saveData.writeToFile(fileNameEntity("list"), atomically: true);
        
    }
    
    private func fileNameEntity(entityName: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("\(entityName).plist")
        
        return path
    }
    
}