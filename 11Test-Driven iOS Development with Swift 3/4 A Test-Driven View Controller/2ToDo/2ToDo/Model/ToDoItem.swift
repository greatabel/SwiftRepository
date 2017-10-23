struct ToDoItem: Equatable {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?

    init(title: String, itemDescription: String? = nil ,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }

    static func ==(lbs: ToDoItem, rhs: ToDoItem) -> Bool {
        if lbs.location != rhs.location {
            return false
        }
        if lbs.timestamp != rhs.timestamp {
            return false
        }
        if lbs.title != rhs.title {
            return false
        }
        return true
    }
}
