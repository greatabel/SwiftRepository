import UIKit

class ItemManager: NSObject {
    var toDoCount: Int {
        return todoItems.count
    }
    var doneCount: Int {
        return doneItems.count
    }

    private var todoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []

    override init() {
        super.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(save),
            name: .UIApplicationWillResignActive,
            object: nil)

        if let nsToDoItems = NSArray(contentsOf: toDoPathURL) {
            for dict in nsToDoItems {
                if let toDoItem = ToDoItem(dict: dict as! [String:Any]) {
                    todoItems.append(toDoItem)
                }
            }
        }


    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        save()
    }

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
    var toDoPathURL: URL {
        let fileURLs = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask)
        guard let documentURL = fileURLs.first else {
            print("Something went wrong. Documents url could not be found")
            fatalError()
        }
        return documentURL.appendingPathComponent("toDoItems.plist")
    }
    @objc func save() {
        let nsToDoItems = todoItems.map { $0.plistDict }
        guard nsToDoItems.count > 0 else {
            try? FileManager.default.removeItem(at: toDoPathURL)
            return
        }
        do {
            let plistData = try PropertyListSerialization.data(
                fromPropertyList: nsToDoItems,
                format: PropertyListSerialization.PropertyListFormat.xml,options: PropertyListSerialization.WriteOptions(0)
            )
            try plistData.write(to: toDoPathURL,
                                options: Data.WritingOptions.atomic)
        } catch {
            print(error)
        }

    }


    
}
