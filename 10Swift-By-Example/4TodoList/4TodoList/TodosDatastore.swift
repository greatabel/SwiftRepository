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
            Todo(description: "吃火锅",
            list: List(description: "家庭") ,
            dueDate: Date(),
            done: false,
            doneDate: nil),
            Todo(description: "买雷神3",
            list: List(description: "个人") ,
            dueDate: Date(),
            done: true,
            doneDate: Date()
            ),
            Todo(description: "学习iOS",
            list: List(description: "工作") ,
            dueDate: Date(),
            done: false,
            doneDate: nil)
        ]
        
    }

    func todos() -> [Todo] {
        return savedTodos
    }

    func lists() -> [List] {
        return [defaultList()] + savedLists
    }
}


// MARK: Actions
extension TodosDatastore {
    func addTodo(todo: Todo) {
        print(#function)
        savedTodos = savedTodos + [todo]
    }

    func deleteTodo(todo: Todo?) {
        print(#function)
        if let todo = todo {
            savedTodos = savedTodos.filter({$0 != todo})
        }
    }

    func doneTodo(todo: Todo) {
        print(#function)
        deleteTodo(todo: todo)
        let doneTodo = Todo(description: todo.description,
                            list: todo.list,
                            dueDate: todo.dueDate,
                            done: true,
                            doneDate: NSDate() as Date)
        addTodo(todo: doneTodo)
    }

    func addListDescription(description: String) {
        if !description.isEmpty {
            savedLists = savedLists + [List(description: description)]
        }
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
