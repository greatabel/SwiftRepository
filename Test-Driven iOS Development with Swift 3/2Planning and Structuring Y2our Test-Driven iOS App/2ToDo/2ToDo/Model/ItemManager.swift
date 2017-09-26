import Foundation

class ItemManager {
    var toDoCount = 0
    let doneCount = 0

    private var todoItems: [ToDoItem] = []

    func add(_ item: ToDoItem) {
        toDoCount += 1
        todoItems.append(item)
    }

    func item(at index: Int) -> ToDoItem {
        return todoItems[index]
    }
}
