import Foundation

class ItemManager {
    var toDoCount = 0
    let doneCount = 0

    func add(_ item: ToDoItem) {
        toDoCount += 1
    }

    func item(at index: Int) -> ToDoItem {
        return ToDoItem(title: "")
    }
}
