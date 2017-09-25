struct ToDoItem {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?

    init(title: String, itemDescription: String? = nil ,
         timestamp: Double? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
    }
}
