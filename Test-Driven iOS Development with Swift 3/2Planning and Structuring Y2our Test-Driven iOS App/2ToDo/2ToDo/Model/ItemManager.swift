import Foundation

class ItemManager {
    var toDoCount = 0
    var doneCount = 0

    private var todoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []

    func add(_ item: ToDoItem) {
        toDoCount += 1
        todoItems.append(item)
    }

    func item(at index: Int) -> ToDoItem {
        return todoItems[index]
    }

    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func checkItem(at index: Int){
        let item  = todoItems.remove(at: index)
        doneItems.append(item)

        toDoCount -= 1
        doneCount += 1

    }
    
}
