struct ToDoItem {
    
    let title: String
    let itemDescription: String?

    init(title: String, itemDescription: String? = nil ) {
        self.title = title
        self.itemDescription = itemDescription
    }
}
