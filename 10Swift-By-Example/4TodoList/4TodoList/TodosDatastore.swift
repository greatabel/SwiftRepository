import Foundation

class TodosDatastore {
    public var savedLists = [List]()
    public var savedTodos = [Todo]()

    init() {
        savedLists = [
            List(description: "Personal"),
            List(description: "Work"),
            List(description: "Family")
        ]

        savedTodos = [
            Todo(description: "Remember the Milk",
            list: List(description: "Family") ,
            dueDate: Date(),
            done: false,
            doneDate: nil),
            Todo(description: "Buy Spider Man Comics",
            list: List(description: "Personal") ,
            dueDate: Date(),
            done: true,
            doneDate: Date()
            ),
            Todo(description: "Release build",
            list: List(description: "Work") ,
            dueDate: Date(),
            done: false,
            doneDate: nil)
        ]
        
    }

    func todos() -> [Todo] {
        return savedTodos
    }

    func lists() -> [List] {
        return savedLists
    }
}


// MARK: Actions
extension TodosDatastore {
    func addTodo(todo: Todo) {
        print("addTodo in TodosDatastore")
        savedTodos = savedTodos + [todo]
    }
    func deleteTodo(todo: Todo?) {
        print("deleteTodo")
    }
    func doneTodo(todo: Todo) {
        print("doneTodo")
    }
}

extension TodosDatastore {
    func defaultList() -> List {
        return List(description: "Personal")
    }

    func defaultDueDate() -> Date {
        let now = Date()
        let secondsInADay = TimeInterval(24 * 60 * 60)
        return now.addingTimeInterval(secondsInADay)
    }
}
