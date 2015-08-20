

import Foundation

protocol StorageDatastore {
    func todos() -> Array<Todo>
    func lists() -> Array<List>
    
    func addTodo(todo: Todo)
    func deleteTodo(todo: Todo)
    func addList(list: List)
}

