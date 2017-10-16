import Foundation

class ItemManager {
    var toDoCount: Int {
        return todoItems.count
    }
    var doneCount: Int {
        return doneItems.count
    }

    private var todoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []

    func add(_ item: ToDoItem) {
//        toDoCount += 1
        if !todoItems.contains(item) {
            todoItems.append(item)
        }
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

//        toDoCount -= 1
//        doneCount += 1

    }
    func uncheckItem(at index: Int){
        let item  = doneItems.remove(at: index)
        todoItems.append(item)
    }

    func removeAll() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
    
}
