import Foundation

class ItemManager {
    var toDoCount = 0
    let doneCount = 0

    func add(_ item: ToDoItem) {
        toDoCount += 1
    }
}
