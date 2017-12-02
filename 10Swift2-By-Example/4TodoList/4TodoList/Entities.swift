import Foundation

struct Todo: Equatable {
    let description: String
    let list: List
    let dueDate: Date
    let done: Bool
    let doneDate: Date?
}

func ==(todo1: Todo, todo2: Todo) -> Bool {
    return todo1.description == todo2.description
        && todo1.dueDate == todo2.dueDate
}

struct List {
    let description: String
}
